import 'package:flutter/material.dart';
import 'package:tte_buddy/utils/AppColor.dart';

class SeatLayout2 extends StatefulWidget {
  @override
  _SeatLayout2State createState() => _SeatLayout2State();
}

class _SeatLayout2State extends State<SeatLayout2> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    index = 0;
    // TODO: implement build
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
            _makeSeat(),
          ],
        ),
      ),
    );
  }
  _makeSeat(){
    return Container(
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
                    (++index).toString(),
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
              SizedBox(width: 15,),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    (++index).toString(),
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
              SizedBox(width: 15,),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    (++index).toString(),
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
              SizedBox(width: 110,),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    (++index).toString(),
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
            ],
          ),
        ],
      ),
    );
  }
}