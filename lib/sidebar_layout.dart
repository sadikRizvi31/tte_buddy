import 'package:flutter/material.dart';
import 'package:tte_buddy/HomePage.dart';
import 'SideBar.dart';

class sidebar_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          SideBar(),
        ],
      ) ,
    );
  }
}
