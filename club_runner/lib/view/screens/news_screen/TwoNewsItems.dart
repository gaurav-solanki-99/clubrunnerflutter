import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../util/asstes_image/AssetsImage.dart';
import '../../../util/my_color/MyColor.dart';
import '../../../util/route_helper/RouteHelper.dart';
import '../../../util/size_config/SizeConfig.dart';

class TwoNewsItemsScreen extends StatefulWidget {
  const TwoNewsItemsScreen({Key? key}) : super(key: key);

  @override
  State<TwoNewsItemsScreen> createState() => _TwoNewsItemsScreenState();
}

class _TwoNewsItemsScreenState extends State<TwoNewsItemsScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();
  var currentDate = DateTime.now().obs;

  List imgList = [
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
    Image.asset(
      MyAssetsImage.app_test_img,
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
          child: Column(
            children: [
              CustomView.cardViewDateClick(
                  "NEWS", fontSize, currentDate, MyColor.app_blue_color, () {
                currentDate.value =
                    currentDate.value.subtract(const Duration(days: 1));
              }, () {
                currentDate.value =
                    currentDate.value.add(const Duration(days: 1));
              }),
              SizedBox(
                height: heightPerBox! * 2,
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Short News Item with NO Images to display",
                        style: MyTextStyle.textStyle(
                            FontWeight.w600, 22, Colors.black),
                      ),
                      SizedBox(height: heightPerBox! * 2),
                      Text(
                        "23 September 2023",
                        style: MyTextStyle.textStyle(
                            FontWeight.w600, 15, Colors.deepOrange),
                      ),
                      SizedBox(height: heightPerBox! * 2),
                      Text(
                        "There are many variations of passages of Lorem Ipsum available",
                        style: MyTextStyle.textStyle(
                            FontWeight.w600, 16, Colors.black),
                      ),
                      SizedBox(height: heightPerBox! * 2),
                      Text(
                        "But the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                        style: MyTextStyle.textStyle(
                            FontWeight.w300, 16, Colors.black),
                      ),
                      SizedBox(height: heightPerBox! * 2),
                      Text(
                        "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                        style: MyTextStyle.textStyle(
                            FontWeight.w300, 16, Colors.black),
                      ),
                      SizedBox(height: heightPerBox! * 2),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heightPerBox! * 3,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Annual Club Dinner and Awards Evening",
                        style: MyTextStyle.textStyle(
                            FontWeight.w600, fontSize! * 5, Colors.black),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1,
                      ),
                      Text(
                        "23 September 2023",
                        style: MyTextStyle.textStyle(
                            FontWeight.w600, fontSize! * 4, Colors.red),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1,
                      ),
                      imgList[0], // Display the first image
                      SizedBox(
                        height: 5,
                      ),
                      // Rest of the images displayed in a row with crossAxisCount 4
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: imgList.length - 1, // Subtracting 1 for the first image
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return  imgList[index + 1]; // Adjust index to start from 1

                        },
                      ),

                      SizedBox(
                        height: heightPerBox! * 1,
                      ),
                      Text(
                        "There are many variations of passages of Lorem Ipsum available.   ",
                        style: MyTextStyle.textStyle(
                            FontWeight.w600, fontSize * 4, Color(0xFF3C4858)),
                      ),
                      SizedBox(
                        height: heightPerBox! * 2,
                      ),
                      Text(
                        "But the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                        style: MyTextStyle.textStyle(
                            FontWeight.w300, fontSize * 4, Color(0xFF3C4858)),
                      ),
                      SizedBox(
                        height: heightPerBox! * 3,
                      ),
                      Text(
                        "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                        style: MyTextStyle.textStyle(
                            FontWeight.w300, fontSize * 4, Color(0xFF3C4858)),
                      ),
                      SizedBox(
                        height: heightPerBox! * 3,
                      ),
                      CustomView.buttonShow("More Info", FontWeight.w600,
                          widthPerBox!, fontSize * 1.2,MyColor.app_orange_color, () {
                            Get.toNamed(RouteHelper.twonewsitemsScreen);
                          }),
                      SizedBox(
                        height: heightPerBox! * 3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: heightPerBox! * 5),
              Image.asset(
                MyAssetsImage.app_club_image_dash_board,
                height: heightPerBox! * 10,
              ),
              SizedBox(height: heightPerBox! * 3),
            ],
          ),
        ),
      ),
    );
  }
}
