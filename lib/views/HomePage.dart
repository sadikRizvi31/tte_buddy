import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tte_buddy/TrainOptions.dart';
import 'package:tte_buddy/utils/AppColor.dart';

import '../sidebar/SideBar.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController tabController,scrollTabController;
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this,length: 3);
    scrollTabController = TabController(vsync: this,length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      backgroundColor: Color(0xFFF9EFEB),
      key: _scafoldKey,
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(55.0)),
                  color: AppColor.primarySwatchColor,
                ),
              ),
              Container(
                height: 145.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0)),
                    color: AppColor.primarySwatchColor[400],
                  ),
              ),
              IconButton(icon: Icon(Icons.menu,color: Colors.black),
                  onPressed: () => _scafoldKey.currentState.openDrawer(),
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
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'OPTIONS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          TabBar(
            controller: scrollTabController,
            indicatorColor: AppColor.primarySwatchColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Cancellation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Reschedule",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Meal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Location",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
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
                  child: Row(
                    children: <Widget>[
                      SizedBox(height: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trainName+" ("+trainNumber+")",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Text(
                                fromS+" - "+toS,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 10.0,),
                              Text(
                                dateT+" - "+timeT,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0,),
                          Container(
                            height: 30.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFF75A4C),
                                style: BorderStyle.solid,
                                width: 0.25,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                "Intercity Train",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.blueGrey
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ),

        ],
      ),
    );
  }
}