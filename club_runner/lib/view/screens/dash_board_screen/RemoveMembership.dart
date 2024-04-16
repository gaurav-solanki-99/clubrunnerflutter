import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../util/size_config/SizeConfig.dart';

class removeMembership extends StatefulWidget {
  const removeMembership({super.key});

  @override
  State<removeMembership> createState() => _removeMembershipState();
}

class _removeMembershipState extends State<removeMembership> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var screenWidth = SizeConfig.screenWidth;
  var fontSize = SizeConfig.fontSize();
  var checked = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
          child: Column(
            children: [
              CustomView.customAppBar(
                  "REMOVE", "MEMBERSHIP", heightPerBox!, fontSize, () {
                Get.back();
              }),
              SizedBox(height: heightPerBox!*1.5,),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "You can remove yourself from this brand / club by deleting your membership below.",
                            style: MyTextStyle.textStyle(FontWeight.w400,
                                fontSize * 3.5, MyColor.app_black_color),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: heightPerBox! * 1.5,
                          ),
                          Text(
                              " Please note this will remove your membership entirely and cannot be undone. ",
                              style: MyTextStyle.textStyle(FontWeight.w500,
                                  fontSize * 3.5, MyColor.app_black_color),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFFD2D2D2),
                      thickness: 1,
                    ),
                    CustomView.differentStyleTextTogether(
                        "REMOVE ",
                        FontWeight.w400,
                        "MEMBERSHIP",
                        FontWeight.w900,
                        fontSize * 3.5,
                        MyColor.app_black_color),
                    Divider(
                      color: Color(0xFFD2D2D2),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Obx(() {
                            return Align(
                              alignment: Alignment.center,
                              child: ListTileTheme(
                                horizontalTitleGap: 0,
                                child: CheckboxListTile(
                                  side: BorderSide(color: Colors.black,width: 2),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  title: Text(
                                    "Confirm Removal and Delete",
                                    style: MyTextStyle.textStyle(FontWeight.w300,
                                        widthPerBox! * 3, MyColor.app_black_color),
                                  ),
                                  value: checked.value,
                                  onChanged: (newValue) {
                                    checked.value = newValue!;
                                  },
                                  contentPadding: EdgeInsets.symmetric(horizontal: widthPerBox!*12),
                                  checkColor: MyColor.app_white_color,
                                  fillColor: MaterialStateProperty.all(checked.value
                                      ? MyColor.screen_bg
                                      : MyColor.app_white_color),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  visualDensity: VisualDensity.compact,
                                ),
                              ),
                            );
                          }),
                          CustomView.buttonShow("REMOVE AND DELETE", FontWeight.w600, widthPerBox!, fontSize, MyColor.app_orange_color, () { }),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
