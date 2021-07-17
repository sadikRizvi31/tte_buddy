import 'package:flutter/material.dart';

class TrainOptions extends StatefulWidget{
  @override
  _TrainOptionsState createState() => _TrainOptionsState();

}

class _TrainOptionsState extends State<TrainOptions> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTrainCard('assets/images/cargo_train.png','Freight',"Cargo Train"),
        _buildTrainCard('assets/images/InterCityTrain.png','Intercity',"Intercity Train"),
        _buildTrainCard('assets/images/Localtrain.png','Local',"Local Train"),
      ],
      scrollDirection: Axis.horizontal,
    );
  }

  _buildTrainCard(String imgPath,String trainType,String trainHint)
  {
    return Padding(
        padding: EdgeInsets.only(top: 8.0,left: 10.0,right: 10.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 3.0,
              spreadRadius: 3.0,
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
                  child: Image.asset(imgPath,
                  fit: BoxFit.cover,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                Positioned(
                  top: 92.0,
                    left: 60.0,
                    child: Container(
                      height: 15.0,
                      width: 55.0,
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
                          "with Cabin",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.blueGrey
                          ),
                        ),
                      ),
                    ),
                ),
              ],
            ),
            Container(
              width: 125.0,
                padding: EdgeInsets.only(left: 15.0,top: 5.0),
              child: Text(trainType,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
                padding: EdgeInsets.only(left: 15.0),
              child: Text(
                trainHint,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}