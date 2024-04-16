import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/custom_view/CustomView.dart';
import '../../../util/size_config/SizeConfig.dart';

class EditPersonalBest extends StatefulWidget {
  const EditPersonalBest({super.key});

  @override
  State<EditPersonalBest> createState() => _EditPersonalBestState();
}

class _EditPersonalBestState extends State<EditPersonalBest> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var screenWidth = SizeConfig.screenWidth;
  var fontSize = SizeConfig.fontSize();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
      child: Column(
        children: [
          CustomView.customAppBar("YOUR ", "PB'S", heightPerBox!, fontSize, () {
            Get.back();
          }),
          SizedBox(height: heightPerBox!*2.5),
          Card(
            color: MyColor.app_white_color,
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: MyColor.app_border_grey_color),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "5KM ",
                                      style: MyTextStyle.textStyle(FontWeight.w700,
                                          fontSize * 3.5, MyColor.app_black_color),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "BEST TIME",
                                          style: MyTextStyle.textStyle(FontWeight.w300,
                                              fontSize * 3.5, MyColor.app_black_color),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: heightPerBox,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildTimeElement("HH","Hours"),
                                      Text(" : ",style: MyTextStyle.textStyle(
                                          FontWeight.w500, fontSize * 3.5, MyColor.app_black_color)),
                                      _buildTimeElement("MM","Minutes"),
                                      Text(" : ",style: MyTextStyle.textStyle(
                                          FontWeight.w500, fontSize * 3.5, MyColor.app_black_color)),
                                      _buildTimeElement("SS","Seconds"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        );
                      }),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: CustomView.transparentButton(MyString.cancel_var, FontWeight.w500, widthPerBox!, fontSize, MyColor.app_black_color, () { })),
                    SizedBox(width: widthPerBox!*4.5,),
                    Expanded(
                        flex: 1,
                        child: CustomView.buttonShow(MyString.save_var, FontWeight.w500, widthPerBox!, fontSize, MyColor.app_orange_color, () { }))
                  ],),
                )
              ],
            ),

          ),
        ],
      ),
    )));
  }

  Widget _buildTimeElement(String value, String label) {
    return Column(
      children: [
        Card(
          color: MyColor.app_text_box_bg_color,
          elevation: 0.0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: MyColor.app_border_grey_color),
              borderRadius: BorderRadius.circular(5)),
          child: SizedBox(
            width: 45,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: MyTextStyle.textStyle(
                    FontWeight.w500, fontSize * 3.5, MyColor.app_orange_color),
              ),
            ),
          ),
        ),
        Text(
          label,
          style: MyTextStyle.textStyle(
              FontWeight.w500, fontSize * 2.5, MyColor.app_black_color),
        ),
      ],
    );
  }
}
