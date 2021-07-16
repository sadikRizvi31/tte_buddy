import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        ],
      ),
    );
  }

}