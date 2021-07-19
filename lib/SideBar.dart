import 'dart:async';

import 'package:flutter/material.dart';
class SideBar extends StatefulWidget {
  @override
    _SideBarState createState() => _SideBarState();
}
class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final bool isSidebarOpened = false;
  StreamController<bool> isSideBarOpenedStreamController;
  StreamSink<bool> isSideBarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: _animationDuration);
  }

  @override
  void dispose()
  {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screemWidth = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left: isSidebarOpened ? 0 : 0,
      right: isSidebarOpened ? 0 : screemWidth - 45,
      child:Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Align(
            alignment: Alignment(0,-0.9),
            child:Container(
              width: 35,
              height: 110.0,
              color: Colors.amber,
              child: AnimatedIcon(
                progress: _animationController.view,
                //icon: ,
              ),
            ),
          ),
        ],
      ) ,
    );

  }

}
