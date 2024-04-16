import 'package:club_runner/util/bottomnav_common/BottomNavigationBarWidget.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../util/asstes_image/AssetsImage.dart';
import '../../../util/custom_view/CustomView.dart';
import '../../../util/size_config/SizeConfig.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  var currentDate = DateTime.now().obs;

  @override
  void initState() {
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
            CustomView.customAppBarWithDrawer(heightPerBox!,(){},(){}),
            SizedBox(
              height: heightPerBox! * 3,
            ),
            CustomView.cardViewDateClick(
                MyString.events_var, fontSize, currentDate,Colors.red, () {
              _decrementDate();
            }, () {
              _incrementDate();
            }),
            SizedBox(
              height: heightPerBox! * 2,
            ),
            _listShow(),
            SizedBox(
              height: heightPerBox! /2,
            ),
            yourWorkOutLogCard(),
            SizedBox(
              height: heightPerBox! * 3,
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: CustomView.differentStyleTextTogether(MyString.happy_birthday_var.substring(0,5), FontWeight.w700, MyString.happy_birthday_var.substring(5), FontWeight.w300, fontSize *4.5,MyColor.app_white_color),
              ),
            ),
            SizedBox(
              height: heightPerBox! *1.3,
            ),
            userNameShow(),

            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                MyAssetsImage.app_club_image_dash_board,
                height: heightPerBox! * 9,
              ),
            ),
          ],
        ),
      ),
    //  bottomNavigationBar:BottomNavigationBarWidget()
    );
  }

  void _incrementDate() {
    currentDate.value = currentDate.value.add(const Duration(days: 1)) ;
  }

  void _decrementDate() {
    currentDate.value = currentDate.value.subtract(const Duration(days: 1));
  }

  Widget _listShow(){
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
      return Card(
          color: MyColor.app_white_color,
          margin: const EdgeInsets.only(bottom: 10),
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                        flex: 0,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("05 : 00",style: MyTextStyle.textStyle(FontWeight.w500, fontSize *4, MyColor.app_white_color),),
                        )
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyColor.app_white_color,
                            border: Border.all(width: 0.0,
                              color: MyColor.app_white_color,)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("A School",style: MyTextStyle.textStyle(FontWeight.w700, fontSize*5, MyColor.app_black_color),),
                            Text("JOHNATHAN & SARAH",style: MyTextStyle.textStyle(FontWeight.w400, fontSize*3, MyColor.app_black_color),),
                            SizedBox(
                              height: heightPerBox,
                            ),
                            Text("Garage to Garage",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*4, MyColor.app_black_color),),
                            Text("9KM",style: MyTextStyle.textStyle(FontWeight.w500, fontSize*4, MyColor.app_pink_color),),
                            Text("Running - Hills",style: MyTextStyle.textStyle(FontWeight.w400, fontSize*4, MyColor.app_hint_color),),
                            SizedBox(
                              height: heightPerBox!,
                            ),
                            Text("Easy warm up around club block, 4 X 100m pick ups with 50m walk between reps.\n15 X 150m in 24-27 with 50m walk between reps\nEasy cool down around club block.",style: MyTextStyle.textStyle(FontWeight.w400, fontSize*3, MyColor.app_black_color),),
                            SizedBox(
                              height: heightPerBox! *2,
                            ),
                            InkWell(
                              onTap: (){
                                Get.toNamed(RouteHelper.getViewRouteScreen());
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(color: MyColor.screen_bg)
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(MyString.view_route_var,style: MyTextStyle.textStyle(FontWeight.w600, fontSize* 3.5,MyColor.screen_bg),),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined,color: MyColor.screen_bg,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      );
    },);
  }


  Widget yourWorkOutLogCard(){
    return  Card(
      color: MyColor.app_white_color,
      shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.zero,
      elevation: 3,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child:  RichText(
                text: TextSpan(
                  text: MyString.your_workout_var.substring(0,4),
                  style: MyTextStyle.textStyle(FontWeight.w400, fontSize *4 , MyColor.app_black_color),
                  children: <TextSpan>[
                    TextSpan(
                      text: MyString.your_workout_var.substring(4),
                      style:MyTextStyle.textStyle(FontWeight.w700, fontSize *4 , MyColor.app_black_color),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )),
          Divider(
            color: MyColor.screen_bg,
            thickness: 2,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: CustomView.buttonShow(MyString.log_your_workout_var, FontWeight.w400, widthPerBox!, fontSize ,  MyColor.app_red_color, () {
              Get.toNamed(RouteHelper.getWorkoutLogbookScreen());
            }),
          )
        ],
      ),
    );
  }


  Widget userNameShow(){
    return  Container(
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: MyColor.app_white_color,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 1)),
      margin: const EdgeInsets.only(bottom: 17),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius:
                BorderRadius.circular(heightPerBox! * 30),
              ),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(heightPerBox! * 17),
                child: FadeInImage.assetNetwork(
                  placeholder: MyAssetsImage.app_loader,
                  placeholderFit: BoxFit.cover,
                  image:
                  "https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&w=600",
                  fit: BoxFit.cover,
                  height: heightPerBox! * 10,
                  width: heightPerBox! * 10,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Johnathan",
                  softWrap: true,
                  style: MyTextStyle.textStyle(
                      FontWeight.w300, fontSize! * 4.5,MyColor.app_black_color),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Ashworth",
                  softWrap: true,
                  style: MyTextStyle.textStyle(
                      FontWeight.w500, fontSize! * 4.5,MyColor.app_black_color),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Icon(
              Icons.arrow_forward_ios,
              color: MyColor.app_white_color,
            ),
          ),
        ],
      ),
    );
  }
}


