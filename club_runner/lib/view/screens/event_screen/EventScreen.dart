import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/bottomnav_common/BottomNavigationBarWidget.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../util/custom_view/CustomView.dart';
import '../../../../util/route_helper/RouteHelper.dart';
import '../../../../util/size_config/SizeConfig.dart';
import '../../../../util/string_const/MyString.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var screenWidth = SizeConfig.screenWidth;
  var fontSize = SizeConfig.fontSize();

  List<String> imgList=[
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: Column(
          children: [
            CustomView.customAppBarWithDrawer(heightPerBox!, () {}, () {}),
            SizedBox(
              height: heightPerBox! * 3.5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: screenWidth,
              decoration: BoxDecoration(
                  color: MyColor.app_blue_color,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                MyString.events_var,
                style: MyTextStyle.textStyle(
                    FontWeight.w700, fontSize * 4.5, MyColor.app_white_color),
                textAlign: TextAlign.center,
              ),
            ),

            showList(),
            SizedBox(height: heightPerBox! * 3.5),
            Image.asset(MyAssetsImage.app_club_image_dash_board,width: widthPerBox!*60),
            SizedBox(height: heightPerBox! * 3.5),
          ],
        ),
      ),
     // bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

  Widget showList(){
    return  ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: imgList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
               Get.toNamed(RouteHelper.getEventDetailScreen());
            },
            child: Container(
              padding: EdgeInsets.all(heightPerBox!),
              margin: EdgeInsets.only(top: heightPerBox!),
              decoration: BoxDecoration(
                  color: MyColor.app_white_color,
                  border:
                  Border.all(color: MyColor.app_border_grey_color),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: MyColor.app_box_grey_event,
                  //         borderRadius: BorderRadius.circular(5)),
                  //     padding: EdgeInsets.all(heightPerBox! * 6),
                  //     child:
                  //   ),
                  // ),
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(imgList[index],fit: BoxFit.fill,))),
                  SizedBox(width: widthPerBox! * 2),
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "Extra long Event Name will truncate after third line this exam...",
                            style: MyTextStyle.textStyle(
                                FontWeight.w500,
                                fontSize * 3.5,
                                MyColor.app_black_color),),
                        Text(
                          "23 September 2023",
                          style: MyTextStyle.textStyle(FontWeight.w500,
                              fontSize * 2.5, MyColor.app_orange_color),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
