import 'package:flutter/material.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/views/SeatUI.dart';

class CoachesData extends StatefulWidget {
  @override
  _CoachesDataState createState() => _CoachesDataState();
}

class _CoachesDataState extends State<CoachesData> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      _buildCoachList("S1", "1","72", "15");
  }
  _buildCoachList(String coachNumber,String seatStart,String seatEnd,String vacantSeat)
  {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.label,
                color: Colors.black,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Coach : '+coachNumber,
                style: TextStyle(
                  color: Colors.black, fontFamily: 'avenir',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 25,),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Text(
                  'Seat :'+seatStart+'-'+seatEnd,
              ),
              SizedBox(width: 25,),
              Text(
                'Vacant seats :'+vacantSeat,
              ),
              SizedBox(width: 15,),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primarySwatchColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColor.primarySwatchColor, width: 2.0)))),
                child: Text('Go ->'),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SeatUI()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
