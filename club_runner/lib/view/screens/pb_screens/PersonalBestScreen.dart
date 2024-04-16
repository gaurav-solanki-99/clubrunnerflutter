import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/asstes_image/AssetsImage.dart';
import '../../../util/size_config/SizeConfig.dart';

class PersonalBest extends StatefulWidget {
  const PersonalBest({super.key});

  @override
  State<PersonalBest> createState() => _PersonalBestState();
}

class _PersonalBestState extends State<PersonalBest> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var screenWidth = SizeConfig.screenWidth;
  var fontSize = SizeConfig.fontSize();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomView.customAppBar("YOUR ", "PB'S", heightPerBox!, fontSize,() {
              Get.back();
            }),
            SizedBox(height: heightPerBox! * 2.5),
            Text(
              "Your Personal Bests",
              style: MyTextStyle.textStyle(
                  FontWeight.w500, fontSize * 5.5, MyColor.app_white_color),
            ),
            SizedBox(height: heightPerBox! * 2.5),
            GridView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.2 / 0.1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "5KM ",
                          style: MyTextStyle.textStyle(FontWeight.w700,
                              fontSize * 2.7, MyColor.app_white_color),
                          children: <TextSpan>[
                            TextSpan(
                              text: "BEST TIME",
                              style: MyTextStyle.textStyle(FontWeight.w300,
                                  fontSize * 2.7, MyColor.app_white_color),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "2:23:06",
                        style: MyTextStyle.textStyle(FontWeight.w300,
                            fontSize * 4.5, MyColor.app_white_color),
                      )
                    ],
                  );
                }),
            SizedBox(height: heightPerBox! * 2.5),
            CustomView.customButtonWithBorder("EDIT BESTS",(){
              print("EDIT BESTS");
              Get.toNamed(RouteHelper.getEditPersonalBestScreen());},widthPerBox!*30),
            SizedBox(height: heightPerBox! * 2.5),
            Center(child: Image.asset(MyAssetsImage.app_club_image_dash_board,width: widthPerBox! *50)),
          ],
        ),
      ),
    ));
  }
}
