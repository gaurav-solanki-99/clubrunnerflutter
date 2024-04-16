import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../util/size_config/SizeConfig.dart';

class ViewRouteScreen extends StatefulWidget {
  const ViewRouteScreen({super.key});

  @override
  State<ViewRouteScreen> createState() => _ViewRouteScreenState();
}

class _ViewRouteScreenState extends State<ViewRouteScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: Column(
          children: [
            CustomView.customAppBar(
                MyString.view_route_var.substring(0, 4),
                MyString.view_route_var.substring(4),
                heightPerBox!,
                fontSize,
                () {
                  Get.back();
                }),
            SizedBox(
              height: heightPerBox! * 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Kloof Mendor Reverse",
                style: MyTextStyle.textStyle(
                    FontWeight.w600, fontSize * 6, MyColor.app_white_color),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "9KM",
                style: MyTextStyle.textStyle(
                    FontWeight.w700, fontSize * 6, MyColor.app_white_color),
              ),
            ),
            SizedBox(
              height: heightPerBox! * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Van Buuren, left into Kloof, left into kilara, Bowling,right into Florence, left into Kloof,left into Pine, right into Oak, right into lavin,left into Kloof, Townsend, Riley",
                style: MyTextStyle.textStyle(
                    FontWeight.w300, fontSize * 3.5, MyColor.app_white_color),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
        // bottomNavigationBar:BottomNavigationBarWidget()
    );
  }
}
