import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../../util/my_color/MyColor.dart';
import '../../../../util/size_config/SizeConfig.dart';
import '../../../../util/string_const/MyString.dart';
import '../../../../util/text_style/MyTextStyle.dart';

class WorkoutLogbookScreen extends StatefulWidget {
  const WorkoutLogbookScreen({super.key});

  @override
  State<WorkoutLogbookScreen> createState() => _WorkoutLogbookScreenState();
}

class _WorkoutLogbookScreenState extends State<WorkoutLogbookScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  var currentDate = DateTime.now().obs;

  var levelType = "EASY".obs;
  var levelCreateType = "EASYCREATE".obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
        EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: Column(
          children: [
            SizedBox(
              height: heightPerBox! * 3,
            ),
            CustomView.customAppBarWithDrawer(heightPerBox!, () {}, () {}),
            SizedBox(
              height: heightPerBox! * 3,
            ),
            CustomView.cardViewDateClick(
                MyString.events_var, fontSize, currentDate,MyColor.app_blue_color, () {
              _decrementDate();
            }, () {
              _incrementDate();
            }),
            SizedBox(
              height: heightPerBox! * 1.5,
            ),
            showWorkoutDetailList(),
            yourWorkOutLogCard(),
            SizedBox(
              height: heightPerBox!,
            ),
          ],
        ),
      ),
        // bottomNavigationBar:const BottomNavigationBarWidget()
    );
  }


  Widget effortLevelBox() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: fontBox(
                MyString.easy_var,
                levelType.value == "EASY"
                    ? MyColor.app_white_color
                    : MyColor.screen_bg,
                levelType.value == "EASY"
                    ? MyColor.screen_bg
                    : MyColor.app_white_color,
                () {
                  levelType.value = "EASY";
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: fontBox(
                MyString.normal_var,
                levelType.value == "NORMAL"
                    ? MyColor.app_white_color
                    : MyColor.screen_bg,
                levelType.value == "NORMAL"
                    ? MyColor.screen_bg
                    : MyColor.app_white_color,
                () {
                  levelType.value = "NORMAL";
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: fontBox(
                MyString.hard_var,
                levelType.value == "HARD"
                    ? MyColor.app_white_color
                    : MyColor.screen_bg,
                levelType.value == "HARD"
                    ? MyColor.screen_bg
                    : MyColor.app_white_color,
                () {
                  levelType.value = "HARD";
                },
              ),
            ),
          ],
        ),
      );
    });
  }
  Widget effortLevelBoxCreateEdit() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: fontBox(
                MyString.easy_var,
                levelCreateType.value == "EASYCREATE"
                    ? MyColor.app_white_color
                    : MyColor.screen_bg,
                levelCreateType.value == "EASYCREATE"
                    ? MyColor.screen_bg
                    : MyColor.app_white_color,
                    () {
                  levelCreateType.value = "EASYCREATE";
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: fontBox(
                MyString.normal_var,
                levelCreateType.value == "NORMALCREATE"
                    ? MyColor.app_white_color
                    : MyColor.screen_bg,
                levelCreateType.value == "NORMALCREATE"
                    ? MyColor.screen_bg
                    : MyColor.app_white_color,
                    () {
                  levelCreateType.value = "NORMALCREATE";
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: fontBox(
                MyString.hard_var,
                levelCreateType.value == "HARDCREATE"
                    ? MyColor.app_white_color
                    : MyColor.screen_bg,
                levelCreateType.value == "HARDCREATE"
                    ? MyColor.screen_bg
                    : MyColor.app_white_color,
                    () {
                  levelCreateType.value = "HARDCREATE";
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget showData(String headingText, value) {
    return Column(
      children: [
        Text(
          headingText,
          style: MyTextStyle.textStyle(
              FontWeight.w600, fontSize * 4.5, MyColor.app_white_color),
        ),
        Text(
          value,
          style: MyTextStyle.textStyle(
              FontWeight.w500, fontSize * 5.5, MyColor.app_white_color),
        ),
      ],
    );
  }

  Widget fontBox(
      String type, Color fontColor, backgroundColor, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: MyColor.screen_bg, width: 1)),
          padding: EdgeInsets.symmetric(
              horizontal: 5, vertical: heightPerBox! * 1.3),
          child: Text(
            type,
            style: MyTextStyle.textStyle(
                FontWeight.w400, fontSize * 3.5, fontColor),
          ),),
    );
  }

  Widget yourWorkOutLogCard() {
    return Card(
      color: MyColor.app_white_color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.zero,
      elevation: 3,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: MyString.log_your_workout_var.substring(0, 4),
                  style: MyTextStyle.textStyle(
                      FontWeight.w400, fontSize * 4, MyColor.app_black_color),
                  children: <TextSpan>[
                    TextSpan(
                      text: MyString.log_your_workout_var.substring(8),
                      style: MyTextStyle.textStyle(FontWeight.w700,
                          fontSize * 4, MyColor.app_black_color),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CustomView.buttonShow(
                MyString.log_your_workout_var,
                FontWeight.w400,
                widthPerBox!,
                fontSize,
                MyColor.app_red_color, () {
              showDialogBox("", "", "",
                  "Create", () {
                Get.back();
              }, () {});
            }),
          )
        ],
      ),
    );
  }

  Widget showWorkoutDetailList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Card(
          color: MyColor.app_white_color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          margin: const EdgeInsets.only(bottom: 10.0),
          elevation: 0,
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                  child: Text(
                    MyString.run_hill_work_var,
                    style: MyTextStyle.textStyle(FontWeight.w600,
                        fontSize * 4.3, MyColor.app_black_color),
                  )),
              Divider(
                color: MyColor.screen_bg,
                thickness: 2,
                height: 0,
              ),
              SizedBox(height: heightPerBox! * 1.5),
              CustomView.differentStyleTextTogether(
                  MyString.effort_level_var.substring(0, 6),
                  FontWeight.w400,
                  MyString.effort_level_var.substring(6),
                  FontWeight.w600,
                  fontSize * 5,
                  MyColor.app_black_color),
              SizedBox(height: heightPerBox!),
              effortLevelBox(),
              Container(
                color: MyColor.screen_bg,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: showData(MyString.dist_var, "13.3KM"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: showData(MyString.time_var, "2:23:21"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: showData(MyString.pace_var, "5:44"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                child: CustomView.differentStyleTextTogether(
                    "${MyString.your_workout_var} ".substring(4),
                    FontWeight.w300,
                    MyString.notes_var,
                    FontWeight.w600,
                    fontSize * 5,
                    MyColor.screen_bg),
              ),
              Divider(
                color: MyColor.screen_bg,
                thickness: 2,
                height: 0,
              ),
              SizedBox(height: heightPerBox! * 2),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "AR stands for Augmented Reality. It's a technology that combines computer-generated images with the real world, typically viewed through a device such as a smartphone, "
                  "tablet, or AR glasses.In AR experiences, digital information or virtual objects are overlaid onto the physical environment, creating an augmented view of reality. This technology has applications across various fields, including gaming, education, retail, healthcare, architecture, and more.",
                  style: MyTextStyle.textStyle(
                      FontWeight.w400, fontSize * 3.5, MyColor.app_black_color),
                ),
              ),
              SizedBox(height: heightPerBox! * 2),
              Divider(
                color: MyColor.screen_bg,
                thickness: 2,
                height: 0,
              ),
              SizedBox(height: heightPerBox! / 2),
              SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {
                    showDialogBox("", "", "",
                        "Edit", () {
                          Get.back();
                        }, () {});
                  },
                  child: Text(
                    MyString.edit_workout_var,
                    style: MyTextStyle.textStyle(FontWeight.w700,
                        fontSize * 4, MyColor.app_black_color),
                  ),
                ),
              ),
              SizedBox(height: heightPerBox! / 2),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> showDialogBox(String headingFirstMSG, headingSecondMSG,
      mainMSG, typeOfClick, VoidCallback cancelClick, saveClick) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)), //this right here
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyString.workout_type_var,
                        style: MyTextStyle.textStyle(FontWeight.w400,
                            fontSize * 3.5, MyColor.app_dark_blue_color),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1.3,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: MyColor.app_textform_bg_color,
                            border: InputBorder.none,
                            hintText: MyString.select_var,
                            hintStyle: MyTextStyle.textStyle(FontWeight.w300,
                                fontSize * 4, MyColor.app_black_color),
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down,
                              color: MyColor.app_black_color,
                            ),),
                      ),
                      SizedBox(
                        height: heightPerBox! * 1.3,
                      ),
                      Divider(
                        thickness: 1,
                        color: MyColor.app_textform_bg_color,
                      ),
                      effortLevelBoxCreateEdit(),
                      Divider(
                        thickness: 1,
                        color: MyColor.app_black_color,
                      ),
                      Text(
                        MyString.distance_var.toUpperCase(),
                        style: MyTextStyle.textStyle(FontWeight.w500,
                            fontSize * 5, MyColor.app_black_color),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: MyColor.app_textform_bg_color,
                                  border: InputBorder.none,
                                  hintText: "0",
                                  hintStyle: MyTextStyle.textStyle(
                                      FontWeight.w300,
                                      fontSize * 4,
                                      MyColor.app_black_color),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ".",
                              style: MyTextStyle.textStyle(FontWeight.w700,
                                  fontSize * 6, MyColor.app_black_color),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: MyColor.app_textform_bg_color,
                                  border: InputBorder.none,
                                  hintText: "0",
                                  hintStyle: MyTextStyle.textStyle(
                                      FontWeight.w300,
                                      fontSize * 4,
                                      MyColor.app_black_color),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        MyString.time_var.toUpperCase(),
                        style: MyTextStyle.textStyle(FontWeight.w500,
                            fontSize * 5, MyColor.app_black_color),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: MyColor.app_textform_bg_color,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:Colors.transparent,
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        hintText: "00",
                                        hintStyle: MyTextStyle.textStyle(
                                            FontWeight.w300,
                                            fontSize * 4,
                                            MyColor.app_black_color),
                                      ),
                                    ),
                                    Text(MyString.hours_var,style: MyTextStyle.textStyle(FontWeight.w500, fontSize*3, MyColor.app_black_color),)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              ":",
                              style: MyTextStyle.textStyle(FontWeight.w700,
                                  fontSize * 6, MyColor.app_black_color),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: MyColor.app_textform_bg_color,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:Colors.transparent,
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        hintText: "00",
                                        hintStyle: MyTextStyle.textStyle(
                                            FontWeight.w300,
                                            fontSize * 4,
                                            MyColor.app_black_color),
                                      ),
                                    ),
                                    Text(MyString.mins_var,style: MyTextStyle.textStyle(FontWeight.w500, fontSize*3, MyColor.app_black_color),)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              ":",
                              style: MyTextStyle.textStyle(FontWeight.w700,
                                  fontSize * 6, MyColor.app_black_color),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: MyColor.app_textform_bg_color,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        contentPadding: EdgeInsets.zero,
                                        fillColor:Colors.transparent,
                                        border: InputBorder.none,
                                        hintText: "00",
                                        hintStyle: MyTextStyle.textStyle(
                                            FontWeight.w300,
                                            fontSize * 4,
                                            MyColor.app_black_color),
                                      ),
                                    ),
                                    Text(MyString.sec_var,style: MyTextStyle.textStyle(FontWeight.w500, fontSize*3, MyColor.app_black_color),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightPerBox,
                      ),
                     CustomView.differentStyleTextTogether("${MyString.pace_var} : ", FontWeight.w500,
                         "0.00 /KM", FontWeight.w500, fontSize*5, MyColor.screen_bg),

                      SizedBox(
                        width: double.infinity,
                        child: TextButton(onPressed: (){}, child: Text(MyString.clear_input_var.toUpperCase(),
                          style: MyTextStyle.textStyle(FontWeight.w500, fontSize*3.5, MyColor.screen_bg),),),
                      ),
                      Divider(
                        thickness: 1,
                        color: MyColor.app_black_color,
                      ),
                      CustomView.differentStyleTextTogether("${MyString.workout_type_var.substring(0,7).toUpperCase()} ", FontWeight.w300,
                          MyString.notes_var.toUpperCase(), FontWeight.w500, fontSize*4, MyColor.app_black_color),
                      SizedBox(
                        height: heightPerBox,
                      ),
                      SizedBox(
                        height:heightPerBox! *20,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyColor.app_textform_bg_color,
                            border: InputBorder.none,
                            hintText: MyString.any_note_to_var,
                            hintStyle: MyTextStyle.textStyle(
                                FontWeight.w300,
                                fontSize * 3,
                                MyColor.app_black_color),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightPerBox! *2,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: CustomView.transparentButton(
                                    MyString.cancel_var,
                                    FontWeight.w300,
                                    widthPerBox!,
                                    fontSize,
                                    Colors.grey.withOpacity(0.5),
                                    cancelClick)),
                            SizedBox(
                              width: widthPerBox! * 2,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomView.buttonShow(
                                  MyString.save_var,
                                  FontWeight.w300,
                                  widthPerBox!,
                                  fontSize,
                                  MyColor.app_pink_color,
                                  saveClick),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightPerBox! *1.3,
                      ),
                      typeOfClick == "Edit"?
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: Icon(Icons.delete,color: MyColor.app_black_color,), // Your icon here
                          label: Text("${MyString.delete_var} ${MyString.workout_type_var.substring(0,7)}",style: MyTextStyle.textStyle(FontWeight.w600, fontSize *3.5, MyColor.app_black_color),), // Your text here
                          onPressed: (){},
                        ),
                      ):const SizedBox(),

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _incrementDate() {
    currentDate.value = currentDate.value.add(const Duration(days: 1));
  }

  void _decrementDate() {
    currentDate.value = currentDate.value.subtract(const Duration(days: 1));
  }
}
