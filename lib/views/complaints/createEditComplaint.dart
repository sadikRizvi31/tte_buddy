import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:tte_buddy/models/ComplaintModel.dart';
import 'package:tte_buddy/utils/AppColor.dart';

class CreateEditComplaintScreen extends StatefulWidget {
  final bool isForEdit;
  final ComplaintModel complaintModel;
  final Function() notifyParent;

  CreateEditComplaintScreen({@required this.isForEdit,this.complaintModel,this.notifyParent});

  @override
  _CreateEditComplaintScreenState createState() => _CreateEditComplaintScreenState();
}

class _CreateEditComplaintScreenState extends State<CreateEditComplaintScreen> {
  Function hp;
  Function wp;

  TextEditingController _pnrController = new TextEditingController();
  TextEditingController _passengerNameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _trainNoController = new TextEditingController();
  TextEditingController _coachIdController = new TextEditingController();

  FocusNode passengerNameFocus = new FocusNode();
  FocusNode descriptionFocus = new FocusNode();
  FocusNode trainNoFocus = new FocusNode();
  FocusNode coachIdFocus = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isForEdit && widget.complaintModel!=null){
      _pnrController.text = widget.complaintModel.PNR;
      _passengerNameController.text = widget.complaintModel.passenger_name;
      _descriptionController.text = widget.complaintModel.description;
      _trainNoController.text = widget.complaintModel.train_no;
      _coachIdController.text = widget.complaintModel.coach_id;
    }
  }
  @override
  Widget build(BuildContext context) {
    hp = Screen(MediaQuery.of(context).size).hp;
    wp = Screen(MediaQuery.of(context).size).wp;
    return Scaffold(
      body: layout(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.appColor,
        foregroundColor: Colors.white,
        onPressed: (){
          if(_passengerNameController.text.isEmpty || _descriptionController.text.isEmpty || _pnrController.text.isEmpty || _trainNoController.text.isEmpty || _coachIdController.text.isEmpty)
            Fluttertoast.showToast(msg: "Please fill all the fields..");
          else {
            if(widget.isForEdit)
              _updateComplaint(widget.complaintModel);
            else
              _addNewComplaint();
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
  layout(){
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  maxWidth: viewportConstraints.maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                        ),
                        border: Border.all(
                          width: 1,
                          color: AppColor.appColor,
                          style: BorderStyle.solid,
                        ),
                        color: AppColor.appColor
                    ),
                    height: hp(33),
                    child: Padding(
                      padding: EdgeInsets.only(top: hp(6),left: wp(5),right: wp(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(alignment: Alignment.centerRight,child: Image.asset("assets/images/complaint_createEdit_icon.png",height: hp(18),width: hp(18))),
                          Text(widget.isForEdit ? "Edit Complaint" : "Register Complaint",style: TextStyle(color: AppColor.white,fontWeight: FontWeight.bold,fontSize: 26)),
                          SizedBox(height: hp(0.8),),
                          Text("Fill complete details",style: TextStyle(color: AppColor.white,fontSize: 16),),
                          SizedBox(height: hp(1),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:hp(5)),
                  Container(
                    padding: EdgeInsets.only(left: wp(6),right: wp(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:hp(1)),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: hp(6.1),
                          decoration: _boxDecoration(),
                          child: TextFormField(
                            controller: _pnrController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'PNR Number',prefixIcon: Icon(Icons.sticky_note_2_rounded)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter PNR Number';
                              }
                              return null;
                            },
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(passengerNameFocus);
                            },
                          ),
                        ),
                        SizedBox(height: hp(2)),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: hp(6.1),
                          decoration: _boxDecoration(),
                          child: TextFormField(
                            controller: _passengerNameController,
                            focusNode: passengerNameFocus,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'Passenger Name',prefixIcon: Icon(Icons.person)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter Passenger Name';
                              }
                              return null;
                            },
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(trainNoFocus);
                            },
                          ),
                        ),
                        SizedBox(height: hp(2),),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: hp(6.1),
                          decoration:  _boxDecoration(),
                          child: TextFormField(
                            controller: _trainNoController,
                            focusNode: trainNoFocus,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'Train No',prefixIcon: Icon(Icons.train_sharp)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter Train No';
                              }
                              return null;
                            },
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(coachIdFocus);
                            },
                          ),
                        ),
                        SizedBox(height: hp(2),),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: hp(6.1),
                          decoration:  _boxDecoration(),
                          child: TextFormField(
                            controller: _coachIdController,
                            focusNode: coachIdFocus,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'Coach Id',prefixIcon: Icon(Icons.indeterminate_check_box)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter CoachId';
                              }
                              return null;
                            },
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(descriptionFocus);
                            },
                          ),
                        ),
                        SizedBox(height: hp(2)),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: hp(6.1),
                          decoration:  _boxDecoration(),
                          child: TextFormField(
                            controller: _descriptionController,
                            focusNode: descriptionFocus,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'Description',prefixIcon: Icon(Icons.description)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter Description';
                              }
                              return null;
                            },

                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  _addNewComplaint(){
    String docId = "C"+new Random().nextInt(9999).toString();
    ComplaintModel complaintModel = new ComplaintModel(PNR: _pnrController.text,passenger_name: _passengerNameController.text,description: _descriptionController.text, coach_id: _coachIdController.text,train_no: _trainNoController.text,status: "Registered",date: new DateFormat().add_yMMMd().format(new DateTime.now()).toString(),complaint_id: docId);

    FirebaseFirestore.instance.collection('Complaints').doc(docId)
        .set({
          'complaint_id':docId,
          'PNR': complaintModel.PNR,
          'passenger_name': complaintModel.passenger_name,
          'status': complaintModel.status,
          'description':complaintModel.description,
          'date': complaintModel.date,
          'train_no': complaintModel.train_no,
          'coach_id': complaintModel.coach_id,
        })
        .then((value) {
            Fluttertoast.showToast(msg: "Complaint Registered Successfully!!");
            widget.notifyParent();
        })
        .catchError((error) => Fluttertoast.showToast(msg: "Failed to add user: $error"));
  }
  _updateComplaint(ComplaintModel model){
    ComplaintModel complaintModel = new ComplaintModel(PNR: _pnrController.text,passenger_name: _passengerNameController.text,description: _descriptionController.text, coach_id: _coachIdController.text,train_no: _trainNoController.text,status: model.status,date: model.date,complaint_id: model.complaint_id);
    FirebaseFirestore.instance.collection('Complaints').doc(model.complaint_id)
        .update({
            'complaint_id':model.complaint_id,
            'PNR': complaintModel.PNR,
            'passenger_name': complaintModel.passenger_name,
            'status': complaintModel.status,
            'description':complaintModel.description,
            'date': complaintModel.date,
            'train_no': complaintModel.train_no,
            'coach_id': complaintModel.coach_id,
        })
        .then((value) {
          Fluttertoast.showToast(msg: "Complaint Updated Successfully!!");
          widget.notifyParent();
        })
        .catchError((error) => Fluttertoast.showToast(msg: "Failed to add user: $error"));
  }
  _boxDecoration(){
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]
    );
  }
}
