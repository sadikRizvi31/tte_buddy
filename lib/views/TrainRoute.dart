import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tte_buddy/models/StationModel.dart';
import 'package:tte_buddy/models/TrainModel.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/LoadingScreen.dart';

class TrainRoute extends StatefulWidget {
  final TrainModel trainModel;
  TrainRoute({@required this.trainModel});

  @override
  _TrainRouteState createState() => _TrainRouteState();
}

class _TrainRouteState extends State<TrainRoute> {
  bool isLoading=true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<StationModel> stationList = new List<StationModel>();
  int currentStopIndex=1;
  double progressValue = 0.01;
  DocumentSnapshot trainDocument;

  @override
  Widget build(BuildContext context) {
    if (isLoading != null && isLoading) {
      callApi();
    } else if (!isLoading) {
      return Scaffold(
        backgroundColor: Color.fromARGB(500,240,255,255),
        key: _scaffoldKey,
        body: layout(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.appColor,
          foregroundColor: Colors.white,
          onPressed: (){
            updateCurrentStop();
          },
          child: Icon(Icons.next_plan_outlined,size: 35),
        ),
      );
    }
    return LoadingScreen();
  }
  Future callApi() async {
    try {
      await _fetchStationList();
    }
    catch (e){}
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }
  _fetchStationList(){
    FirebaseFirestore.instance.collection('Train').document(widget.trainModel.train_no).collection("Route").get().then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            StationModel model = new StationModel(station_code: doc["station_code"],name: doc["name"],arr_time: doc["arr_time"],dept_time: doc["dept_time"]);
            stationList.add(model);
          });
        });
      }
    });
    FirebaseFirestore.instance.collection('Train').doc(widget.trainModel.train_no).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          trainDocument=documentSnapshot;
        });
      }
    });
  }
  Widget layout(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back,color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(width: 80,),
              Text(
                'Assinged Coaches',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(width: 30,),
              /* ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primarySwatchColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColor.primarySwatchColor, width: 2.0)))),
                child: Icon(Icons.add_location_alt_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrainRouteUI()));
                },
              ),*/
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Text(
                widget.trainModel.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColor.primarySwatchColor
                ),
              ),
            ),
          ),
          Container(
            height: 600,
            padding: EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("Begin"),
                    SizedBox(height: 10,),
                    Container(
                      width: 15,
                      height: 450,
                      child: RotatedBox(
                        quarterTurns: -3,
                        child: LinearProgressIndicator(
                          value: progressValue,
                          valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      "End",
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: false,
                      // scrollDirection: Axis.horizontal,
                      itemCount: stationList.length,
                      padding: EdgeInsets.all(15.0),
                      itemBuilder: (BuildContext context, int index) {
                        return _buildStationUI(stationList[index]);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  updateCurrentStop(){
    if(currentStopIndex<=stationList.length){
      FirebaseFirestore.instance.collection('Tickets').where('train_no',isEqualTo: widget.trainModel.train_no).where('start_stop',isEqualTo: stationList[currentStopIndex-1].station_code).get().then((QuerySnapshot querySnapshot) {
        if(querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            trainDocument.reference.collection("Compartment").doc(doc["coach_id"]).collection("Seats").doc(doc["seat_id"]).get()
              .then((DocumentSnapshot documentSnapshot){
                if(documentSnapshot["is_checked"]==false){
                  trainDocument.reference.collection("Compartment").doc(doc["coach_id"]).collection("Seats").doc(doc["seat_id"])
                      .update({'is_vacant':true})
                      .catchError((error) => Fluttertoast.showToast(msg: "Something went wrong!!"));
                }
              });

          });
        }
        Fluttertoast.showToast(msg: "Current stop updated!!");
        setState(() {
          currentStopIndex+=1;
          progressValue+=0.20;
        });
      });
    }
    else{
      Fluttertoast.showToast(msg: "You have reached at the end...");
    }
  }
  _buildStationUI(StationModel model){
    return Container(
        width: 250,
        padding: EdgeInsets.all(15),
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name+"("+model.station_code+")",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Arrival Date Time :"+model.arr_time,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 11,
              ),
            ),
            Text("Departure Date Time :"+model.dept_time,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 11,
              ),
            ),
          ],
        )
    );
  }
}
