import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../util/size_config/SizeConfig.dart';
import '../../../util/text_style/MyTextStyle.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();
  Duration? _timeDifference = const Duration();
  var currentDate = DateTime.now().obs;

  List<String> imgList=[
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
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
            CustomView.customAppBarWithDrawer(heightPerBox!, () {}, () {}),
            CustomView.cardViewDateClick(
                "NEWS", fontSize, currentDate, MyColor.app_orange_color, () {
              currentDate.value =
                  currentDate.value.subtract(const Duration(days: 1));
            }, () {
              currentDate.value =
                  currentDate.value.add(const Duration(days: 1));
            }),
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
                      "Sandra Takes Podium at Pirates 10K in time of 53:04",
                      style: MyTextStyle.textStyle(
                          FontWeight.w600, fontSize * 5, Colors.black),
                    ),
                    SizedBox(
                      height: heightPerBox! * 1,
                    ),
                    Text(
                      "23 September 2023",
                      style: MyTextStyle.textStyle(
                          FontWeight.w600, fontSize * 4, Colors.red),
                    ),
                    SizedBox(
                      height: heightPerBox! * 1,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(imgList[0],fit: BoxFit.fill,)),

                    SizedBox(
                      height: 5,
                    ),// Display the first image
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
                        return  ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(imgList[index],fit: BoxFit.fill,)); // Adjust index to start from 1
                      },
                    ),
                    SizedBox(
                      height: heightPerBox! * 1,
                    ),
                    Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                      style: MyTextStyle.textStyle(
                          FontWeight.w500, fontSize * 4, Color(0xFF3C4858)),
                    ),
                    SizedBox(
                      height: heightPerBox! * 2,
                    ),
                    Text(
                      "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                      style: MyTextStyle.textStyle(
                          FontWeight.w500, fontSize * 4, Color(0xFF3C4858)),
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
      // bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
