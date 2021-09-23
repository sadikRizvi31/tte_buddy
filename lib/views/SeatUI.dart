import 'package:flutter/material.dart';
import 'package:tte_buddy/sidebar/SideBar.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/views/Coaches.dart';
import 'package:tte_buddy/views/SeatLayout2.dart';

class SeatUI extends StatefulWidget {
  @override
  _SeatUIState createState() => _SeatUIState();
}

class _SeatUIState extends State<SeatUI> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Color.fromARGB(500,240,255,255),
        drawer: SideBar(),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(icon: Icon(Icons.menu,color: Colors.black),
                    onPressed: () => _scafoldKey.currentState.openDrawer(),
                  ),
                  SizedBox(width: 80,),
                  Text(
                    'Coach S1',
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
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Coaches()));
  }
  
}