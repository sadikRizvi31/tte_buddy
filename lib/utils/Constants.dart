import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tte_buddy/utils/TextStyle.dart';

import 'AppColor.dart';

class Constants {

  static const String appName = "TTE Buddy";
  static const double padding =20;
  static const double avatarRadius =45;

  static const int NO_INTERNET = 1;
  static const int FOR_LOGIN = 2;
  static const int NORMAL_VALIDATION = 1;
  static const int EMAIL_VALIDATION = 2;
  static const int PHONE_VALIDATION = 3;
  static const int STRONG_PASSWORD_VALIDATION = 4;
  static const int PHONE_OR_EMAIL_VALIDATION = 5;

  static const int SEND_OTP_FROM_FORGOT_PASSWORD = 1;
  static const int SEND_OTP_FROM_CREATE_ACCOUNT = 2;
  static const int SEND_OTP_FROM_PROFILE = 3;

  static const double APP_BAR_IMAGE_SIZE=70.0;

  static Map<String,String> hashMap = Map<String, String>();

  static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static progressDialog(
      bool isLoading, BuildContext context, String resourceData) async {
    AlertDialog dialog = new AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      content: new Container(
          height: 100.0,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpinKitThreeBounce(
                  color: AppColor.appColor,
                  size: 30.0,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TitleText(text: "Please wait", color: Colors.white)
              ],
            ),
          )),
      contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
    );
    if (!isLoading) {
      Navigator.of(context).pop();
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return dialog;
          });
    }
  }
}

