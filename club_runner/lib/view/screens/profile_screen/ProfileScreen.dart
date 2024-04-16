import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../util/custom_view/CustomView.dart';
import '../../../util/my_color/MyColor.dart';
import '../../../util/size_config/SizeConfig.dart';
import '../../../util/string_const/MyString.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: heightPerBox! * 3,
              ),
              CustomView.customAppBar(
                  MyString.profile_var.substring(0,3), MyString.profile_var.substring(3), heightPerBox!,fontSize, () {
                Get.back();
              }),
              SizedBox(height: heightPerBox! * 3),
              const Divider(),
              SizedBox(
                height: heightPerBox! * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(heightPerBox! * 30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(heightPerBox! * 17),
                      child: FadeInImage.assetNetwork(
                        placeholder: MyAssetsImage.app_your_profile_dash_board,
                        image: "https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&w=600",
                        fit: BoxFit.cover,
                        height: heightPerBox! * 12,
                        width: heightPerBox! * 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          "Johnathan",
                          softWrap: true,
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 4.5,MyColor.app_white_color),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Ashworth",
                          softWrap: true,
                          style: MyTextStyle.textStyle(
                              FontWeight.w500, fontSize * 4.5,MyColor.app_white_color),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightPerBox! * 2,
              ),
              const Divider(),
              SizedBox(
                height: heightPerBox! * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomView.differentStyleTextTogether(
                            "${MyString.fkm_var} ",
                            FontWeight.w500,
                            MyString.besttime_var,
                            FontWeight.w300,
                            fontSize* 3.5,MyColor.app_white_color),
                        Text(
                          "2:23:06",
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 5,MyColor.app_white_color),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomView.differentStyleTextTogether(
                            "${MyString.tkm_var} ",
                            FontWeight.w500,
                            MyString.besttime_var,
                            FontWeight.w300,
                            fontSize* 3.5,MyColor.app_white_color),
                        Text(
                          "2:23:06",
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 5,MyColor.app_white_color),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomView.differentStyleTextTogether(
                            "${MyString.tonekm_var} ",
                            FontWeight.w500,
                            MyString.besttime_var,
                            FontWeight.w300,
                            fontSize* 3.5,MyColor.app_white_color),
                        Text(
                          "2:23:06",
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 5,MyColor.app_white_color),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightPerBox! * 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomView.differentStyleTextTogether(
                            "${MyString.fkm_var} ",
                            FontWeight.w500,
                            MyString.besttime_var,
                            FontWeight.w300,
                            fontSize* 3.5,MyColor.app_white_color),
                        Text(
                          "2:23:06",
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 5,MyColor.app_white_color),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomView.differentStyleTextTogether(
                            "${MyString.tkm_var} ",
                            FontWeight.w500,
                            MyString.besttime_var,
                            FontWeight.w300,
                            fontSize* 3.5,MyColor.app_white_color),
                        Text(
                          "2:23:06",
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 5,MyColor.app_white_color),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomView.differentStyleTextTogether(
                            "${MyString.tonekm_var} ",
                            FontWeight.w500,
                            MyString.besttime_var,
                            FontWeight.w300,
                            fontSize* 3.5,MyColor.app_white_color),
                        Text(
                          "2:23:06",
                          style: MyTextStyle.textStyle(
                              FontWeight.w300, fontSize* 5,MyColor.app_white_color),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightPerBox! * 2,
              ),
              const Divider(),
              RichText(
                  text: TextSpan(
                      text: "RACE ",
                      style: MyTextStyle.textStyle(
                          FontWeight.w500, fontSize * 4.5,MyColor.app_white_color),
                      children: <TextSpan>[
                    TextSpan(
                        text: "RESULTS",
                        style: MyTextStyle.textStyle(
                            FontWeight.w300,fontSize * 4.5,MyColor.app_white_color),)
                  ],),),
              const Divider(),
              raceResultListShow(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("M O R E",style: MyTextStyle.textStyle(FontWeight.w200, fontSize* 4.5,MyColor.app_white_color),),
                  const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,)
                ],
              ),

              SizedBox(
                height: heightPerBox! * 2,
              ),
              const Divider(),
              RichText(
                  text: TextSpan(
                      text: "BIRTHDAY ",
                      style: MyTextStyle.textStyle(
                          FontWeight.w500, fontSize * 4.5,MyColor.app_white_color),
                      children: <TextSpan>[
                        TextSpan(
                            text: "- 23 JUNE",
                            style: MyTextStyle.textStyle(
                                FontWeight.w500, fontSize * 4.5,MyColor.app_white_color),)
                      ],),),
              const Divider(),
              SizedBox(
                height: heightPerBox! * 4,
              ),
              Text("082-234-7878",style: MyTextStyle.textStyle(FontWeight.w600, fontSize* 4.5,MyColor.app_white_color),),
              SizedBox(
                height: heightPerBox!,
              ),
              Text("gerald@in-detail.com",style: MyTextStyle.textStyle(FontWeight.w600, fontSize* 4,MyColor.app_white_color),),
              SizedBox(
                height: heightPerBox! * 8,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.getEditProfileScreen());
                },
                child: Container(
                  width: widthPerBox! * 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.white)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("EDIT PROFILE",style: MyTextStyle.textStyle(FontWeight.w600, fontSize* 4,MyColor.app_white_color),),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heightPerBox! * 5,
              ),
             Image.asset(MyAssetsImage.app_club_image_dash_board, height: heightPerBox! * 10,
               width: heightPerBox! * 30,),
              SizedBox(
                height: heightPerBox! * 8,
              ),
            ],
          ),
        ),
      ),
     //   bottomNavigationBar:BottomNavigationBarWidget()
    );
  }


  Widget raceResultListShow(){
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Text(
              "EDENVALE MARATHON",
              style: MyTextStyle.textStyle(
                  FontWeight.w600, fontSize * 4.5,MyColor.app_white_color),
            ),
            SizedBox(
              height: heightPerBox! * 1,
            ),
            RichText(
              text: TextSpan(
                text: "SUN",
                style: MyTextStyle.textStyle(
                    FontWeight.w600, fontSize* 3.5,MyColor.app_white_color),
                children: <TextSpan>[
                  TextSpan(
                      text: " 5NOV 2024 ",
                      style: MyTextStyle.textStyle(
                          FontWeight.w300, fontSize* 3.5,MyColor.app_white_color)),
                  TextSpan(
                      text: "- 4:34p/km ",
                      style: MyTextStyle.textStyle(
                          FontWeight.w200, fontSize* 3.5,MyColor.app_white_color)),
                  TextSpan(
                      text: "- 42.2 KM ",
                      style: MyTextStyle.textStyle(
                          FontWeight.w300, fontSize* 3.5,MyColor.app_white_color)),
                  TextSpan(
                      text: "- 35:32",
                      style: MyTextStyle.textStyle(
                          FontWeight.w600, fontSize* 3.5,MyColor.app_white_color)),
                ],
              ),
              textAlign: TextAlign.center,),
          ],
        ),
      );
    },);
  }
}
