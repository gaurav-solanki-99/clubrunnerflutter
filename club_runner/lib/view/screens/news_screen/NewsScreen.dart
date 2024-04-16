import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../util/size_config/SizeConfig.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var screenWidth = SizeConfig.screenWidth;
  var fontSize = SizeConfig.fontSize();

  List<String> imgList=[
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: Column(
          children: [
            SizedBox(height: heightPerBox! * 5),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: MyColor.app_white_color,size: heightPerBox! * 4),
                  Image.asset(MyAssetsImage.app_event_icon_bottom_nav,
                      height: heightPerBox! * 3.5),
                ],
              ),
            ),
            SizedBox(
              height: heightPerBox! * 3,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: screenWidth,
              decoration: BoxDecoration(
                  color: MyColor.app_blue_color,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                MyString.news_var,
                style: MyTextStyle.textStyle(
                    FontWeight.w700, fontSize * 4.5, MyColor.app_white_color),
                textAlign: TextAlign.center,
              ),
            ),
            showNewsList(),
            SizedBox(height: heightPerBox! * 5),
            Image.asset(
              MyAssetsImage.app_club_image_dash_board,
              height: heightPerBox! * 10,
            ),
            SizedBox(height: heightPerBox! * 3),
          ],
        ),
      ),
    //  bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }


  Widget showNewsList(){
    return  ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: imgList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Get.toNamed(RouteHelper.newsDetails_Screen);
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
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(imgList[index],fit: BoxFit.fill,)),
                  ),
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
