import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(39, 105, 171, 1)
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 34),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.color_lens,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "My Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Nisebuschgardens',
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      //height:   ,
                    )
                  ],
                )
            ),
          ),
        )
      ],
    );
  }
}