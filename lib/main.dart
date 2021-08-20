import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tte_buddy/LoginPage.dart';
import 'package:tte_buddy/SplashScreen.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/utils/Constants.dart';

import 'HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return SomethingWentWrong();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if(FirebaseAuth.instance.currentUser!=null){
            return returnMaterialApp(HomePage());
          }
          return returnMaterialApp(LoginPage());
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
  SomethingWentWrong(){
    return MaterialApp(home: Scaffold(body:
      Center(child: Text("Something went wrong...",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),))
    ));
  }
  Widget returnMaterialApp(Widget _screen){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: AppColor.appColor,
          primaryColor: AppColor.appColor,
          buttonTheme: ButtonThemeData().copyWith(
              buttonColor: AppColor.appColor,
              textTheme: ButtonTextTheme.primary),
          fontFamily: "Roboto",
        ),
        home: _screen);
  }
  Loading(){
    return returnMaterialApp(SplashScreen());
  }
}




