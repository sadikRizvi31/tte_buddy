import 'package:flutter/material.dart';
import 'package:tte_buddy/utils/AppColor.dart';

class SeatLayout extends StatefulWidget {
  @override
  _SeatLayoutState createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (ctx,index){
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {

                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
                      width: MediaQuery.of(context).size.width / 15,
                      height: MediaQuery.of(context).size.width / 15,
                      decoration: BoxDecoration(
                        color: AppColor.primarySwatchColor,
                          borderRadius: BorderRadius.circular(5.0))),
                );
              }),
        ],
      ),
    );
  }
}