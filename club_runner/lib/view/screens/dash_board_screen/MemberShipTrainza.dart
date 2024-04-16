import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../util/asstes_image/AssetsImage.dart';
import '../../../util/my_color/MyColor.dart';
import '../../../util/size_config/SizeConfig.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
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
            children: [
              CustomView.customAppBar("MEMBER", "SHIP", heightPerBox!, fontSize,
                  () {
                Get.back();
              }),
              SizedBox(height: heightPerBox! * 3),
              CustomView.membershipStatus(() {}, "NOT ACTIVE!",
                  Icon(Icons.cancel, color: MyColor.app_white_color)),
              SizedBox(height: heightPerBox! * 1),
              Card(
                margin: EdgeInsets.zero,
                color: MyColor.app_light_grey_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(color: MyColor.app_white_color)),
                child: Column(children: [
                  // CustomView.buttonShow("About", FontWeight.w900, 0, fontSize, MyColor.app_orange_color, () {}),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: screenWidth,
                    decoration: BoxDecoration(color: MyColor.app_orange_color),
                    child: Text(
                      "About",
                      style: MyTextStyle.textStyle(
                          FontWeight.w900, fontSize*3.5, MyColor.app_white_color,),textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Bedfordview Athletics",
                            style: MyTextStyle.textStyle(FontWeight.w600,
                                fontSize * 5.5, MyColor.app_black_color)),
                        SizedBox(height: heightPerBox! * 1.5),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
                      ],
                    ),
                  ),
                  Divider(color: Color(0xFF3F3F3F)),
                  CustomView.differentStyleTextTogether(
                      "CONTACT ",
                      FontWeight.w400,
                      "DETAILS",
                      FontWeight.w700,
                      fontSize * 4.5,
                      MyColor.app_black_color),
                  SizedBox(
                    height: heightPerBox,
                  ),
                  Text(
                    "PHONE",
                    style: MyTextStyle.textStyle(FontWeight.w700,
                        fontSize * 3.5, MyColor.app_black_color),
                  ),
                  Text(
                    "+27-082-412-3880",
                    style: MyTextStyle.textStyle(FontWeight.w600,
                        fontSize * 4.5, MyColor.app_black_color),
                  ),
                  SizedBox(
                    height: heightPerBox,
                  ),
                  Text(
                    "EMAIL",
                    style: MyTextStyle.textStyle(FontWeight.w700,
                        fontSize * 3.5, MyColor.app_black_color),
                  ),
                  Text(
                    "info@bedfordviewathlticsnorth.com",
                    style: MyTextStyle.textStyle(FontWeight.w400,
                        fontSize * 4.0, MyColor.app_black_color),
                  ),
                  SizedBox(
                    height: heightPerBox,
                  ),
                  Text(
                    "WEBSITE",
                    style: MyTextStyle.textStyle(FontWeight.w700,
                        fontSize * 3.5, MyColor.app_black_color),
                  ),
                  Text(
                    "www.bedfordviewathletics.co.za",
                    style: MyTextStyle.textStyle(FontWeight.w500,
                        fontSize * 3.7, MyColor.app_black_color),
                  ),
                  SizedBox(
                    height: heightPerBox,
                  ),
                  Text(
                    "LOCATION",
                    style: MyTextStyle.textStyle(FontWeight.w700,
                        fontSize * 3.5, MyColor.app_black_color),
                  ),
                  Text(
                    "The Great Hall at the Bedfordview Country Club (behind the sheds)",
                    textAlign: TextAlign.center,
                    style: MyTextStyle.textStyle(FontWeight.w500,
                        fontSize * 3.7, MyColor.app_black_color),
                  ),
                  SizedBox(
                    height: heightPerBox,
                  ),
                  Text("SOUTH AFRICA,\nGAUTENG\nBEDFORDVIEW",
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomView.buttonShowWithdifferentTextStyle(
                            "VIEW ",
                            "LOCATION",
                            FontWeight.w400,
                            FontWeight.w700,
                            widthPerBox!,
                            fontSize * 4.5,
                            MyColor.app_orange_color,
                            () {}),
                        SizedBox(
                          height: heightPerBox,
                        ),
                        CustomView.buttonShowWithdifferentTextStyle(
                            "VIEW ",
                            "WEBSITE",
                            FontWeight.w400,
                            FontWeight.w700,
                            widthPerBox!,
                            fontSize * 4.5,
                            MyColor.app_orange_color,
                            () {}),
                        SizedBox(
                          height: heightPerBox,
                        ),
                        CustomView.buttonShowWithdifferentTextStyle(
                            "SEND ",
                            "EMAIL",
                            FontWeight.w400,
                            FontWeight.w700,
                            widthPerBox!,
                            fontSize * 4.5,
                            MyColor.app_orange_color,
                            () {}),
                        SizedBox(
                          height: heightPerBox,
                        ),
                        CustomView.buttonShowWithdifferentTextStyle(
                            "PHONE ",
                            "CALL",
                            FontWeight.w400,
                            FontWeight.w700,
                            widthPerBox!,
                            fontSize * 4.5,
                            MyColor.app_orange_color,
                            () {}),
                        SizedBox(
                          height: heightPerBox,
                        ),
                        CustomView.buttonShowWithdifferentTextStyle(
                            "SEND ",
                            "WHATSAPP",
                            FontWeight.w400,
                            FontWeight.w700,
                            widthPerBox!,
                            fontSize * 4.5,
                            MyColor.app_orange_color,
                            () {}),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(height: heightPerBox! * 1),
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                      "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600")),
              SizedBox(height: heightPerBox! * 1),
              Image.asset(MyAssetsImage.app_club_image_dash_board,
                  width: widthPerBox! * 60),
              SizedBox(height: heightPerBox! * 2.5),
              CustomView.customButtonWithBorder("REMOVE MEMBERSHIP", () {
                Get.toNamed(RouteHelper.removemembershipScreen);
              }, widthPerBox! * 50),
              SizedBox(height: heightPerBox! * 3.5),
              CustomView.differentStyleTextTogether(
                  "POWERED ",
                  FontWeight.w400,
                  "BY",
                  FontWeight.w900,
                  fontSize * 3.5,
                  MyColor.app_white_color),
              SizedBox(height: heightPerBox! * 1),
              Image.asset(MyAssetsImage.app_trainza_img),
              SizedBox(height: heightPerBox! * 2.5),
              CustomView.differentStyleTextTogether(
                  "VISIT ",
                  FontWeight.w400,
                  "WEBSITE",
                  FontWeight.w900,
                  fontSize * 3.5,
                  MyColor.app_white_color),
              SizedBox(height: heightPerBox! * 1),
              CustomView.differentStyleTextTogether(
                  "CONTACT ",
                  FontWeight.w400,
                  "US",
                  FontWeight.w900,
                  fontSize * 3.5,
                  MyColor.app_white_color),
              SizedBox(height: heightPerBox! * 1),
              CustomView.differentStyleTextTogether(
                  "PRIVACY ",
                  FontWeight.w400,
                  "POLICY",
                  FontWeight.w900,
                  fontSize * 3.5,
                  MyColor.app_white_color),
              SizedBox(height: heightPerBox! * 1),
              CustomView.differentStyleTextTogether(
                  "TERMS & ",
                  FontWeight.w400,
                  "CONDITIONS",
                  FontWeight.w900,
                  fontSize * 3.5,
                  MyColor.app_white_color),
              SizedBox(height: heightPerBox! * 2.5),
            ],
          ),
        ),
      ),
    );
  }
}
