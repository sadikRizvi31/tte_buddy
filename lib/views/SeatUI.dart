import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tte_buddy/models/CoachModel.dart';
import 'package:tte_buddy/sidebar/SideBar.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/LoadingScreen.dart';
import 'package:tte_buddy/views/SeatLayout2.dart';

class SeatUI extends StatefulWidget {
  final CoachModel coachModel;

  SeatUI({@required this.coachModel});
  @override
  _SeatUIState createState() => _SeatUIState();
}

class _SeatUIState extends State<SeatUI> {
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
    FirebaseFirestore.instance.collection('Train').document(widget.coachModel.train_no).collection("Compartment").doc(widget.coachModel.coach_id).collection("Seats").get().then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            CoachModel model = new CoachModel(coach_id: doc["coach_id"],vacant_seats: doc["vacant_seats"],no_of_seats: doc["no_of_seats"],start_seat: doc["start_seat"],train_no: widget.coachModel.train_no);
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
          SeatLayout2(),
        ],
      ),
    );
  }
}