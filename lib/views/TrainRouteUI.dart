import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainRouteUI extends StatefulWidget {
  @override
  _TrainRouteUIState createState() => _TrainRouteUIState();
}

class _TrainRouteUIState extends State<TrainRouteUI> with SingleTickerProviderStateMixin{
  var stations = ["Mumbai Central (BCT)","Borivali (BVI)","Surat (ST)","Vadodara Junction (BRC)","Ratlam Junction (RTM)","	Kota Junction (KOTA)","New Delhi (NDLS)"];

  DateTime now;
  final DateFormatter = DateFormat('yyyy-MM-dd hh:mm:ss');
  AnimationController controller;
  Animation<double> animation;
  final int duration = 0;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    const duration = const Duration(seconds:1); //duration is set to one second
    new Timer.periodic(duration, (Timer t) => setState((){
      now = DateTime.now();
    }));
    controller = AnimationController(
        duration: const Duration(milliseconds: 900000), vsync: this);
    animation = Tween(begin: 0.28, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.repeat();
  }


  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                SizedBox(width: 100,),
                Text(
                  "Train Route",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Text(
              "<Train Name>",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Column(
                      children: [
                        Text("Begin"),
                        SizedBox(height: 10,),
                        Container(
                          width: 15,
                          height: 509,
                          child: RotatedBox(
                            quarterTurns: -3,
                            child: LinearProgressIndicator(
                              value: animation.value,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        printStations(0,duration + 2),
                        printStations(1,duration + 4),
                        printStations(2,duration + 6),
                        printStations(3,duration + 8),
                        printStations(4,duration + 10),
                        printStations(5,duration + 12),
                        printStations(6,duration + 14),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  printStations(int i,int dur){
    if(stations.length == i){
      return;
    }
    final duration = dur;
    return Container(
        width: 250,
        padding: EdgeInsets.all(15),
        height: 80,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  stations[i],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              "Arrival Date Time :"+DateFormatter.format(now.add(Duration(hours: duration))),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 11,
              ),
            ),
            Text(
              "   Departure Date Time :"+DateFormatter.format(now.add(Duration(hours: duration,minutes: 20))),
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