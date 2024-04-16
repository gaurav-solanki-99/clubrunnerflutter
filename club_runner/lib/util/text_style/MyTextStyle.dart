

import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:flutter/material.dart';

class MyTextStyle{

  static TextStyle? welcome_msg_style(FontWeight fontWeight,double fontSize) {
    return TextStyle(
      color: MyColor.app_white_color,
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      fontSize: fontSize
    );
  }

  static TextStyle? black_text_welcome_msg_style(FontWeight fontWeight,double fontSize) {
    return TextStyle(
        color: MyColor.app_black_color,
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        fontSize: fontSize
    );
  }

  static TextStyle? textStyle(FontWeight fontWeight,double fontSize,Color myColor) {
    return TextStyle(
        color: myColor,
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        fontSize: fontSize
    );
  }

  //Button Text Style
  static TextStyle? buttonTextStyle(FontWeight fontWeight,double fontSize) {
    return TextStyle(
        color: MyColor.app_white_color,
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        fontSize: fontSize
    );
  }
}