import 'package:flutter/material.dart';
import 'package:tte_buddy/utils/AppColor.dart';

class SeatLayout2 extends StatefulWidget {
  @override
  _SeatLayout2State createState() => _SeatLayout2State();
}

class _SeatLayout2State extends State<SeatLayout2> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
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
}