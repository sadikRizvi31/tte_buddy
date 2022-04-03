import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:intl/intl.dart';
import 'package:tte_buddy/models/ComplaintModel.dart';
import 'package:tte_buddy/sidebar/SideBar.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/LoadingScreen.dart';
import 'package:tte_buddy/views/complaints/createEditComplaint.dart';

class ViewComplaintList extends StatefulWidget {

  @override
  _ViewComplaintListState createState() => _ViewComplaintListState();
}

class _ViewComplaintListState extends State<ViewComplaintList> {
  Function hp;
  Function wp;
  bool isLoading=true;

  List<ComplaintModel> complaintList = new List<ComplaintModel>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    hp = Screen(MediaQuery.of(context).size).hp;
    wp = Screen(MediaQuery.of(context).size).wp;

    if (isLoading != null && isLoading) {
      callApi();
    } else if (!isLoading) {
      return new Scaffold(
        body: layout(),
        backgroundColor: Color.fromARGB(500,240,255,255),
        drawer: SideBar(),
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.appColor,
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder:(context) => CreateEditComplaintScreen(isForEdit: false,notifyParent: callApi)));
          },
          child: Icon(Icons.add),
        ),
      );
    }
    return LoadingScreen();
  }
  Future callApi() async {
    try {
      await _fetchComplaints();
    }
    catch (e){}
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }
  layout(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black),
                onPressed: () => Navigator.pop(context),
            )),
            SizedBox(width: 80,),
            Text(
              'Complaints',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        complaintList.isNotEmpty ?
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: wp(2),vertical: hp(1)),
              itemCount: complaintList.length,
              itemBuilder: (BuildContext context, int index){
                ComplaintModel model = complaintList[index];
                return Container(
                  height: hp(12),
                  padding: EdgeInsets.symmetric(vertical: hp(0.1)),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context) => CreateEditComplaintScreen(isForEdit: true,complaintModel: model,notifyParent: callApi,)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: AppColor.lightGrey,
                      child: Row(
                        children: [
                          Container(
                            width: wp(2.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                              color: _getStatusColor(model.status),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Container(width: wp(90),alignment: Alignment.topRight,padding: EdgeInsets.only(right: wp(1)),child: Text(model.isActive ? "Active" : "Disabled" ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Constants.getStatusColor(model.isActive ? "Active" : "Disabled")))),
                              // Text(,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                                    child: Image.asset("assets/images/complaint_icon.png",height: hp(7),width: hp(7)),
                                  ),
                                  SizedBox(width: wp(1)),
                                  Container(
                                    width: wp(40),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(width: wp(65),child: Text(model.complaint_id,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.black))),
                                        SizedBox(height: hp(0.5)),
                                        Container(width: wp(65),child: Text(model.status,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: _getStatusColor(model.status)))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ) :
        _buildEmptyListLayout()
      ],
    );
  }
  _buildEmptyListLayout(){
    return Column(
      children: [
        SizedBox(height: hp(25)),
        Image.asset("assets/images/no_appointments.png",height: hp(30),width: hp(30)),
        Text("No Complaints..",style: TextStyle(fontSize: 19,color: AppColor.appColor,fontWeight: FontWeight.bold),)
      ],
    );
  }
  _fetchComplaints() async{
    complaintList.clear();
    await FirebaseFirestore.instance.collection('Complaints').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          ComplaintModel model = new ComplaintModel(complaint_id: doc["complaint_id"],PNR: doc["PNR"],passenger_name: doc["passenger_name"],status: doc["status"],description: doc["description"],date: doc["date"],train_no: doc["train_no"],coach_id: doc["coach_id"]);
          complaintList.add(model);
        });
      });
    });
  }
  _getStatusColor(String status){
    switch(status){
      case "Registered" : return AppColor.appColor; break;
      case "Solved" : return Colors.lightGreen; break;
      case "Rejected" : return Colors.red; break;
      default : return AppColor.appColor;
    }
  }
}
