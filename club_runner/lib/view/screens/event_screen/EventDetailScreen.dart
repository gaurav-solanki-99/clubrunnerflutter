import 'dart:async';

import 'package:club_runner/util/bottomnav_common/BottomNavigationBarWidget.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../util/asstes_image/AssetsImage.dart';
import '../../../../util/custom_view/CustomView.dart';
import '../../../../util/size_config/SizeConfig.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var screenWidth = SizeConfig.screenWidth;
  var fontSize = SizeConfig.fontSize();

  TextEditingController distanceCtrl = TextEditingController();
  late Timer _timer;
  Duration? _timeDifference = const Duration();
  var currentDate = DateTime.now().obs;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _calculateTimeDifference();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _calculateTimeDifference();
      });
    });
  }

  List<String> imgList=[
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
          child: Column(
            children: [
              CustomView.customAppBarWithDrawer(heightPerBox!, () {}, () {}),
              SizedBox(
                height: heightPerBox! * 3,
              ),
              CustomView.cardViewDateClick(MyString.events_var, fontSize,
                  currentDate, MyColor.app_blue_color, () {
                currentDate.value =
                    currentDate.value.subtract(const Duration(days: 1));
              }, () {
                currentDate.value =
                    currentDate.value.add(const Duration(days: 1));
              }),
              Card(
                margin: const EdgeInsets.only(top: 10),
                color: MyColor.app_white_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Weekly Time Trials",
                          style: MyTextStyle.textStyle(FontWeight.w600,
                              fontSize * 4.5, MyColor.app_black_color)),
                      SizedBox(
                        height: heightPerBox! * 2,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(imgList[0],fit: BoxFit.fill,)),
                      // Rest of the images displayed in a row with crossAxisCount 4
                      SizedBox(height: 5),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: imgList.length-1, // Subtracting 1 for the first image
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(imgList[index + 1],fit: BoxFit.fill,));
                        },
                      ),

                      SizedBox(
                        height: heightPerBox! * 2,
                      ),
                      Text("Weekly Time Trials kick off the right way",
                          style: MyTextStyle.textStyle(FontWeight.w600,
                              fontSize * 3.5, MyColor.app_black_color)),
                      SizedBox(
                        height: heightPerBox!,
                      ),
                      Text(
                          "But the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                          style: MyTextStyle.textStyle(FontWeight.w300,
                              fontSize * 3.5, MyColor.app_black_color)),
                      SizedBox(
                        height: heightPerBox! * 1.5,
                      ),
                      showBoxData(
                        MyString.date_var,
                        Column(
                          children: [
                            CustomView.differentStyleTextTogether(
                                "Wed ",
                                FontWeight.w300,
                                "26 December 2024",
                                FontWeight.w600,
                                fontSize * 3.5,
                                MyColor.app_black_color),
                            SizedBox(
                              height: heightPerBox! * 1.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1.5,
                      ),
                      showBoxData(
                        MyString.time_space_var,
                        Column(
                          children: [
                            Text("17:30",
                                style: MyTextStyle.textStyle(FontWeight.w600,
                                    fontSize * 3.5, MyColor.app_black_color)),
                            SizedBox(
                              height: heightPerBox! * 1.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1.5,
                      ),
                      showBoxData(
                        MyString.venue_var,
                        Column(
                          children: [
                            Text(
                                "Bedfordview Country Club Bowls Bar Bedfordview",
                                style: MyTextStyle.textStyle(FontWeight.w600,
                                    fontSize * 3.5, MyColor.app_black_color),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: heightPerBox! * 1.5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 20,
                                  ),
                                  Text(MyString.view_location_var,
                                      style: MyTextStyle.textStyle(
                                          FontWeight.w600,
                                          fontSize * 2.5,
                                          MyColor.app_black_color),
                                      textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: heightPerBox! * 1.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1.5,
                      ),
                      CustomView.buttonShow(
                        MyString.bookNow_var,
                        FontWeight.w600,
                        widthPerBox!,
                        fontSize,
                        MyColor.app_pink_color,
                        () {},
                      )
                    ],
                  ),
                ),
              ),
              submitResultCard(),
              Card(
                color: MyColor.app_white_color,
                margin: EdgeInsets.only(top: heightPerBox!),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: [
                        Icon(
                          Icons.timer_outlined,
                          size: widthPerBox! * 7.5,
                        ),
                        SizedBox(width: widthPerBox! * 2.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "4KM ",
                                style: MyTextStyle.textStyle(FontWeight.w700,
                                    fontSize * 3.5, MyColor.app_orange_color),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "RESULTS",
                                    style: MyTextStyle.textStyle(
                                        FontWeight.w300,
                                        fontSize * 3.5,
                                        MyColor.app_black_color),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "ALL ",
                                style: MyTextStyle.textStyle(FontWeight.w900,
                                    fontSize * 3.5, MyColor.app_orange_color),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "- WOMEN - MEN",
                                    style: MyTextStyle.textStyle(
                                        FontWeight.w600,
                                        fontSize * 3.5,
                                        MyColor.app_black_color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                    ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: (index % 2 == 0)
                                ? const Color(0xFFEEEEEE)
                                : MyColor.app_white_color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Text("1 "),
                                  SizedBox(width: widthPerBox! * 3.5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Johnathan Green"),
                                      RichText(
                                        text: TextSpan(
                                          text: "24:23    ",
                                          style: MyTextStyle.textStyle(
                                              FontWeight.w700,
                                              fontSize * 3.5,
                                              MyColor.app_orange_color),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "M",
                                              style: MyTextStyle.textStyle(
                                                  FontWeight.w700,
                                                  fontSize * 3.5,
                                                  MyColor.app_black_color),
                                            ),
                                            TextSpan(
                                              text: "34    5:45 P/KM  ",
                                              style: MyTextStyle.textStyle(
                                                  FontWeight.w300,
                                                  fontSize * 3.5,
                                                  MyColor.app_black_color),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
              Card(
                color: MyColor.app_white_color,
                margin: EdgeInsets.only(top: heightPerBox!),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(children: [
                        Icon(
                          Icons.timer_outlined,
                          size: widthPerBox! * 7.5,
                        ),
                        SizedBox(width: widthPerBox! * 2.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "8KM ",
                                style: MyTextStyle.textStyle(FontWeight.w700,
                                    fontSize * 3.5, MyColor.app_orange_color),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "RESULTS",
                                    style: MyTextStyle.textStyle(
                                        FontWeight.w300,
                                        fontSize * 3.5,
                                        MyColor.app_black_color),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "ALL ",
                                style: MyTextStyle.textStyle(FontWeight.w900,
                                    fontSize * 3.5, MyColor.app_orange_color),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "- WOMEN - MEN",
                                    style: MyTextStyle.textStyle(
                                        FontWeight.w600,
                                        fontSize * 3.5,
                                        MyColor.app_black_color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                    ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: (index % 2 == 0)
                                ? const Color(0xFFEEEEEE)
                                : MyColor.app_white_color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Text("1 "),
                                  SizedBox(width: widthPerBox! * 3.5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Johnathan Green"),
                                      RichText(
                                        text: TextSpan(
                                          text: "24:23    ",
                                          style: MyTextStyle.textStyle(
                                              FontWeight.w700,
                                              fontSize * 3.5,
                                              MyColor.app_orange_color),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "M",
                                              style: MyTextStyle.textStyle(
                                                  FontWeight.w700,
                                                  fontSize * 3.5,
                                                  MyColor.app_black_color),
                                            ),
                                            TextSpan(
                                              text: "34    5:45 P/KM  ",
                                              style: MyTextStyle.textStyle(
                                                  FontWeight.w300,
                                                  fontSize * 3.5,
                                                  MyColor.app_black_color),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
              pollShowCard(),
              SizedBox(
                height: heightPerBox! * 2,
              ),
              Image.asset(MyAssetsImage.app_club_image_dash_board,
                  width: widthPerBox! * 50),
            ],
          ),
        ),
        // bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }

  void _calculateTimeDifference() {
    final now = DateTime.now();
    final defaultTime = DateTime(now.year, now.month, now.day, 12,
        0); // Assuming default time is 12:00 PM
    final difference = now.difference(defaultTime);
    if (difference.isNegative) {
      _timeDifference = null;
    } else {
      _timeDifference = difference;
    }
  }

  Widget _buildTimeElement(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColor.app_white_color,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Text(
            value,
            style: MyTextStyle.textStyle(
                FontWeight.w500, fontSize * 3.5, MyColor.app_orange_color),
          ),
          Text(
            label,
            style: MyTextStyle.textStyle(
                FontWeight.w500, fontSize * 2.5, MyColor.app_black_color),
          ),
        ],
      ),
    );
  }

  Widget showBoxData(String heading, Widget remainWidgetColumn) {
    return SizedBox(
      width: screenWidth,
      child: Card(
        color: MyColor.app_light_grey_color,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(children: [
          Card(
            color: MyColor.app_white_color,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                heading,
                style: MyTextStyle.textStyle(
                    FontWeight.w700, fontSize * 3.5, MyColor.app_black_color),
              ),
            ),
          ),
          SizedBox(
            height: heightPerBox! * 1.5,
          ),
          remainWidgetColumn,
        ]),
      ),
    );
  }

  Widget submitResultCard() {
    final hours = _timeDifference?.inHours;
    final minutes = _timeDifference?.inMinutes.remainder(60);
    final seconds = _timeDifference?.inSeconds.remainder(60);
    return Card(
      color: MyColor.app_light_grey_color,
      margin: EdgeInsets.only(top: heightPerBox!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(MyString.submit_result_var,
                style: MyTextStyle.textStyle(
                    FontWeight.w700, fontSize * 4.5, MyColor.app_black_color),
                textAlign: TextAlign.center),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            CustomView.profileTextFiled(
                distanceCtrl,
                TextInputType.number,
                MyString.select_distance_var,
                widthPerBox!,
                fontSize * 3.5,
                false),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildTimeElement(
                      "Hours",
                      hours.toString().padLeft(2, '0'),
                    ),
                  ),
                  Text(
                    " : ",
                    style: MyTextStyle.textStyle(FontWeight.w900,
                        fontSize * 5.5, MyColor.app_black_color),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildTimeElement(
                      "Mins",
                      minutes.toString().padLeft(2, '0'),
                    ),
                  ),
                  Text(
                    " : ",
                    style: MyTextStyle.textStyle(FontWeight.w900,
                        fontSize * 5.5, MyColor.app_black_color),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildTimeElement(
                      "Secs",
                      seconds.toString().padLeft(2, '0'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            CustomView.buttonShow(
                MyString.submitYourResult_var,
                FontWeight.w500,
                widthPerBox!,
                fontSize,
                MyColor.app_pink_color, () {
              FocusScope.of(context).unfocus();
            }),
            RichText(
              text: TextSpan(
                text: MyString.mistake_var,
                style: MyTextStyle.textStyle(
                    FontWeight.w500, fontSize * 3.5, MyColor.app_orange_color),
                children: <TextSpan>[
                  TextSpan(
                    text: MyString.editYourResult_var,
                    style: MyTextStyle.textStyle(FontWeight.w400,
                        fontSize * 3.5, MyColor.app_black_color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pollShowCard() {
    return Card(
      color: MyColor.app_white_color,
      margin: const EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("How many cups of coffee do you drink each day?",
                style: MyTextStyle.textStyle(
                    FontWeight.w500, fontSize * 4.5, MyColor.app_black_color)),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            pollOptionsCard("Less then 1 cup"),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            pollOptionsCard("1 - 4 cups of coffee"),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            pollOptionsCard("5 cups of coffee or more"),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            CustomView.buttonShow(
              "VOTE NOW",
              FontWeight.w600,
              widthPerBox!,
              fontSize,
              MyColor.app_pink_color,
              () {},
            ),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            Text("VOTE TO VIEW RESULTS",
                style: MyTextStyle.textStyle(FontWeight.w600, fontSize * 3.5,
                    MyColor.app_text_grey_event)),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget pollOptionsCard(String optionName) {
    return SizedBox(
      width: screenWidth,
      child: Card(
        color: MyColor.app_light_grey_color,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(optionName),
        ),
      ),
    );
  }
}
