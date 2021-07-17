import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tte_buddy/TrainOptions.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this,length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9EFEB),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(55.0)),
                  color: Colors.yellow,
                ),
              ),
              Container(
                height: 145.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0)),
                    color: Colors.yellow[400],
                  ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 60.0,left: 20.0),
                child: Text(
                  "Welcome <Username>,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 120,left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                    ),
                    ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      hintText: 'Enter Query',
                      hintStyle: TextStyle(fontSize: 15.0),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height - 550.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new TrainOptions(),
                new TrainOptions(),
                new TrainOptions(),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'CURRENT TASK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          _listItem("<Train Name>","train number","From <Station name>","To : <StationName>","Date","Time"),
        ],
      ),
    );
  }

  _listItem(String trainName,String trainNumber,String fromS,String toS,String dateT,String timeT)
  {
    return Padding(
        padding: EdgeInsets.only(left: 15.0,top: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 15.0,
              top: 30.0,
              child: Container(
                height: 125.0,
                width: MediaQuery.of(context).size.width - 15.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF9EFEB),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3.0,
                      blurRadius: 3.0,
                    )
                  ]
                ),
                child: Text("Hello World"),
              )
          ),
          Positioned(
            left: 95.0,
            top: 64.0,
            child: Container(
              height: 105.0,
              width: MediaQuery.of(context).size.width - 15.0,
              decoration: BoxDecoration(
                  color: Color(0xFFF9EFEB),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3.0,
                      blurRadius: 3.0,
                    )
                  ]
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0,left: 10.0),
                  child: Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 5.0,),
                      Text(
                        "no. pass",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 25.0,),
                      Icon(Icons.account_tree_outlined),
                      SizedBox(width: 5.0,),
                      Text(
                        "no. Coach",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Icon(Icons.weekend_outlined),
                      SizedBox(width: 5.0,),
                      Text(
                        "vacnt seats",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),

              ),
            ),
        ],
      ),
    );
  }
}