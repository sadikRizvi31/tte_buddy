import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tte_buddy/models/CoachModel.dart';
import 'package:tte_buddy/models/TrainModel.dart';
import 'package:tte_buddy/sidebar/SideBar.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/LoadingScreen.dart';

import 'SeatUI.dart';

class Coaches extends StatefulWidget {
  final TrainModel trainModel;

  Coaches({@required this.trainModel});
  @override
  _CoachesState createState() => _CoachesState();
}

class _CoachesState extends State<Coaches>{
  bool isLoading=true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CoachModel> coachList = new List<CoachModel>();

  @override
  Widget build(BuildContext context) {
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
      await _fetchCoachList();
    }
    catch (e){}
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }
  _fetchCoachList(){
    FirebaseFirestore.instance.collection('Train').document(widget.trainModel.train_no).collection("Compartment").get().then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            CoachModel model = new CoachModel(coach_id: doc["coach_id"],vacant_seats: doc["vacant_seats"],no_of_seats: doc["no_of_seats"],start_seat: doc["start_seat"],train_no: widget.trainModel.train_no);
            coachList.add(model);
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
              IconButton(icon: Icon(Icons.menu,color: Colors.black),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
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
            ],
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: false,
                  // scrollDirection: Axis.horizontal,
                  itemCount: coachList.length,
                  padding: EdgeInsets.all(15.0),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCoachesCard(coachList[index]);
                  }),
          ),

        ],
      ),
    );
  }
  _buildCoachesCard(CoachModel coachModel){
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10),
      margin: EdgeInsets.only(top:15),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.label,
                color: Colors.black,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Coach : '+coachModel.coach_id,
                style: TextStyle(
                  color: Colors.black, fontFamily: 'avenir',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 25,),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Text(
                'Seat :'+coachModel.start_seat+'-'+coachModel.no_of_seats,
              ),
              SizedBox(width: 25,),
              Text(
                'Vacant seats :'+coachModel.vacant_seats,
              ),
              SizedBox(width: 15,),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primarySwatchColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColor.primarySwatchColor, width: 2.0)))),
                child: Text('Go ->'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeatUI()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
