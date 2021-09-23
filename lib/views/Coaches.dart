import 'package:flutter/material.dart';
import 'package:tte_buddy/CoachesData.dart';
import 'package:tte_buddy/sidebar/SideBar.dart';
import 'package:tte_buddy/views/HomePage.dart';

class Coaches extends StatefulWidget {
  @override
  _CoachesState createState() => _CoachesState();
}

class _CoachesState extends State<Coaches>{
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
                    'Assinged Coaches',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(15),
                    children: [
                      CoachesData(),
                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
