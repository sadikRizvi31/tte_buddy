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
        ],
      ),
    );
  }

}