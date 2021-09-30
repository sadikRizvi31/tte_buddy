import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/Constants.dart';

class SeatLayout2 extends StatefulWidget {
  @override
  _SeatLayout2State createState() => _SeatLayout2State();
}

class _SeatLayout2State extends State<SeatLayout2> {
  int index = 0;
  Function hp;
  Function wp;

  @override
  Widget build(BuildContext context) {
    hp = Screen(MediaQuery.of(context).size).hp;
    wp = Screen(MediaQuery.of(context).size).wp;
    index = 0;
    // TODO: implement build
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
          ],
        ),
      ),
    );
  }
  _makeSeat(){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: contentBox(context),
                      );;
                    },
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      (++index).toString(),
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
              ),
              SizedBox(width: 15,),
              GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Center(child: Text('PNR : <PNR DETAILS>')),
                              SizedBox(height: 5),
                              Center(child: Text('From : : <StationName>')),
                              SizedBox(height: 5),
                              Center(child: Text('To : <Station Name>')),
                              SizedBox(height: 5),
                              Center(child: Text('Age : <Umr>')),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      (++index).toString(),
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
              ),
              SizedBox(width: 15,),
              GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Center(child: Text('PNR : <PNR DETAILS>')),
                              SizedBox(height: 5),
                              Center(child: Text('From : : <StationName>')),
                              SizedBox(height: 5),
                              Center(child: Text('To : <Station Name>')),
                              SizedBox(height: 5),
                              Center(child: Text('Age : <Umr>')),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      (++index).toString(),
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
              ),
              SizedBox(width: 110,),
              GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Center(child: Text('PNR : <PNR DETAILS>')),
                              SizedBox(height: 5),
                              Center(child: Text('From : : <StationName>')),
                              SizedBox(height: 5),
                              Center(child: Text('To : <Station Name>')),
                              SizedBox(height: 5),
                              Center(child: Text('Age : <Umr>')),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      (++index).toString(),
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
              ),
            ],
          ),
        ],
      ),
    );

  }
  contentBox(context){
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
              Text("PNR: 898765792",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("Boarding Stop: SURAT (SRT)",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("End Stop: DELHI (DD)",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("No of Passengers: 3",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              Text("\n1) John Smith(M-32) \n2) Albert Cristiano(M-28) \n3) Leenaben Chopra(F-22)",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
              // Text("No of Passengers: 3",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),

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
}