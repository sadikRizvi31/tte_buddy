import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tte_buddy/models/CoachModel.dart';
import 'package:tte_buddy/models/SeatModel.dart';
import 'package:tte_buddy/sidebar/SideBar.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/Constants.dart';
import 'package:tte_buddy/utils/LoadingScreen.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class SeatUI extends StatefulWidget {
  final CoachModel coachModel;

  SeatUI({@required this.coachModel});
  @override
  _SeatUIState createState() => _SeatUIState();
}

class _SeatUIState extends State<SeatUI> {
  bool isLoading=true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<SeatModel> seatList = new List<SeatModel>();
  Function hp;
  Function wp;
  String result = "Hello World...!";
  Future _qrScanner() async{
    var cameraStatus = await Permission.camera.status;
    if(cameraStatus.isGranted)
        {
          String cameraScanResult = await scanner.scan();
          print(cameraScanResult);
        }
      else{
        var isGrant = await Permission.camera.request();
        if(isGrant.isGranted){
          String cameraScanResult = await scanner.scan();
          print(cameraScanResult);
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    hp = Screen(MediaQuery.of(context).size).hp;
    wp = Screen(MediaQuery.of(context).size).wp;
    if (isLoading != null && isLoading) {
      callApi();
    } else if (!isLoading) {
      return Scaffold(
        backgroundColor: Color.fromARGB(500,240,255,255),
        drawer: SideBar(),
        key: _scaffoldKey,
        body: layout(),
      );
    }
    return LoadingScreen();
  }
  Future callApi() async {
    try {
      await _fetchSeatList();
    }
    catch (e){}
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }
  _fetchSeatList(){
    FirebaseFirestore.instance.collection('Train').document(widget.coachModel.train_no).collection("Compartment").doc(widget.coachModel.coach_id).collection("Seats").get().then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            SeatModel model = new SeatModel(PNR: doc["PNR"],is_checked: doc["is_checked"],is_vacant: doc["is_vacant"],label: doc["label"],train_no: widget.coachModel.train_no,coach_id: widget.coachModel.coach_id);
            seatList.add(model);
          });
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
                widget.coachModel.coach_id,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "C",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.primarySwatchColor,
                      ),
                    ),
                    Text("Checked"),
                    SizedBox(width: 25,),
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "V",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                    Text("Vacant"),
                    SizedBox(width: 15,),
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "U",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.redAccent,
                      ),
                    ),
                    Text("Unchecked"),
                  ],
                ),
              ],
            ),
          ),
          createSeatUI(),
        ],
      ),
    );
  }
  Widget createSeatUI(){
    return Expanded(
      child: ListView.builder(
          shrinkWrap: false,
          // scrollDirection: Axis.horizontal,
          itemCount: ((seatList.length)/4).round(),
          padding: EdgeInsets.all(10.0),
          itemBuilder: (BuildContext context, int index) {
            int i = index*4;
            List<Widget> list = new List<Widget>();
            list.add(createOneSeat(seatList[i]));
            list.add(SizedBox(width: wp(1)));
            list.add(createOneSeat(seatList[i+1]));
            list.add(SizedBox(width: wp(1)));
            list.add(createOneSeat(seatList[i+2]));
            list.add(SizedBox(width: wp(20)));
            list.add(createOneSeat(seatList[i+3]));

            return Row(children: list);
            // return _buildSeatRow(index*4);
          }),
    );
  }
  Widget createOneSeat(SeatModel model){
    return GestureDetector(
      onTap: () {
        _qrScanner();
        // print("Length"+widget.seatList.length.toString());
        // print(widget.seatList[index].toString())

        //print("Seat Id"+model.PNR);
      },
      onLongPress: (){
        fetchSeatDetails(model);
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            model.label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: model.is_vacant==false ? Colors.white : Colors.black,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: model.is_vacant ? Colors.white : (model.is_checked ? AppColor.primarySwatchColor : Colors.redAccent),
        ),
      ),
    );
  }
  contentBox(context,doc,passengerNames,noOfPassengers){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.padding, right: Constants.padding,bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Seat Details",style: TextStyle(color: AppColor.appColor,fontWeight: FontWeight.bold,fontSize: 26)),
              // SizedBox(height: hp(2),),
              // Image.asset(ImageStrings.appointmentIcon,height: hp(25),width: hp(25)),
              SizedBox(height: hp(2),),
              Text("PNR: "+doc["PNR"],textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("Boarding Stop: "+doc["start_stop"],textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("End Stop: "+doc["end_stop"],textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("No of Passengers: "+noOfPassengers.toString(),textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text(passengerNames,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              // Text("\n1) John Smith(M-32) \n2) Albert Cristiano(M-28) \n3) Leenaben Chopra(F-22)",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              SizedBox(height: hp(1.5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel",style: TextStyle(fontSize: 17),)),
                  Container(
                    width: wp(30),
                    child: RaisedButton(
                      padding: EdgeInsets.all(hp(1.2)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Text("View",style: TextStyle(color: Colors.white,fontSize: 16)),
                      color: AppColor.appColor.shade50,
                      onPressed: (){
                        // Navigator.push(context,MaterialPageRoute(builder:(context) => ViewAppointmentsCustomer()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  fetchSeatDetails(SeatModel model){
    FirebaseFirestore.instance.collection('Tickets').where('train_no',isEqualTo: model.train_no).where('PNR',isEqualTo: model.PNR).get().then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot doc = querySnapshot.docs[0];
        String passengerData = "";
        int len=0;
        doc.reference.collection("Passengers").getDocuments().then((QuerySnapshot querySnapshot){
          if(querySnapshot.docs.isNotEmpty) {
            querySnapshot.docs.forEach((doc) {
              len++;
              passengerData+="\n"+doc["name"]+"("+doc["gender"]+"-"+doc["age"]+")";
            });
          }
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: contentBox(context,doc,passengerData,len),
              );
            },
          );
        });
      }
    });
  }
}