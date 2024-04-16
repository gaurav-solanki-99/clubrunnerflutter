import 'package:club_runner/controller/MainScreenController.dart';
import 'package:club_runner/util/bottomnav_common/BottomNavigationBarWidget.dart';
import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/local_storage/LocalStorage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/size_config/SizeConfig.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  LocalStorage sp = LocalStorage();




  var fontType = "medium".obs;

  @override
  void initState() {
    super.initState();
    if(LocalStorage.getStringValue(sp.fontSizeType) != ""){
      fontType.value = LocalStorage.getStringValue(sp.fontSizeType);
    }

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: StatefulBuilder(
          builder: (context, setState) {
            return  Column(
              children: [
                SizedBox(
                  height: heightPerBox! * 3,
                ),
                CustomView.customAppBar(MyString.setting_var.substring(0, 4),
                    MyString.setting_var.substring(4), heightPerBox!,fontSize,
                        () {
                  Get.back(result: 'refresh');
                  
                }),
                SizedBox(
                  height: heightPerBox! * 3,
                ),
                Divider(
                  color: MyColor.app_white_color,
                  height: 1,
                ),
                SizedBox(
                  height: heightPerBox! * 2,
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Obx(()=>
                          fontBox(MyString.sml_var,
                            fontType.value == "small"?
                            MyColor.screen_bg : MyColor.app_white_color,

                            fontType.value == "small"?
                            MyColor.app_white_color: MyColor.screen_bg,
                                (){
                              fontType.value = "small";
                              SizeConfig().init(context,fontType.value);
                              fontSize = SizeConfig.fontSize();
                              LocalStorage.setStringValue(sp.fontSizeType, fontType.value);
                              setState((){

                              });
                            },))
                      ,),

                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child:Obx(()=>
                          fontBox(MyString.std_var,
                            fontType.value == "medium"?
                            MyColor.screen_bg : MyColor.app_white_color,

                            fontType.value == "medium"?
                            MyColor.app_white_color: MyColor.screen_bg,
                                (){
                              fontType.value = "medium";
                              SizeConfig().init(context,fontType.value);
                              fontSize = SizeConfig.fontSize();
                              LocalStorage.setStringValue(sp.fontSizeType, fontType.value);
                              setState((){

                              });
                            },),),),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child:Obx(()=>
                          fontBox(MyString.lrd_var,
                            fontType.value == "large"?
                            MyColor.screen_bg : MyColor.app_white_color,

                            fontType.value == "large"?
                            MyColor.app_white_color: MyColor.screen_bg,
                                (){
                              fontType.value = "large";
                              SizeConfig().init(context,fontType.value);
                              fontSize = SizeConfig.fontSize();
                              LocalStorage.setStringValue(sp.fontSizeType, fontType.value);
                              setState((){

                              });
                            },),),),
                  ],
                ),
                SizedBox(
                  height: heightPerBox! * 2,
                ),
                Divider(
                  color: MyColor.app_white_color,
                  height: 0.7,
                ),
                SizedBox(
                  height: heightPerBox!,
                ),
                Text(MyString.font_example_var,style: MyTextStyle.textStyle(FontWeight.w300, fontSize *3.8,MyColor.app_white_color),),
                SizedBox(
                  height: heightPerBox! ,
                ),
                Divider(
                  color: MyColor.app_white_color,
                  height: 0.7,
                ),
                SizedBox(
                  height: heightPerBox! * 3 ,
                ),
                Text(MyString.this_is_heading_var,style: MyTextStyle.textStyle(FontWeight.w300, fontSize *6,MyColor.app_white_color),textAlign: TextAlign.center,),
                SizedBox(
                  height: heightPerBox! * 3 ,
                ),
                Text(MyString.this_is_a_body_copy_var,style: MyTextStyle.textStyle(FontWeight.w300, fontSize *3.8,MyColor.app_white_color),textAlign: TextAlign.center),

              ],
            );
          },
        ),
      ),
    //  bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

  Widget  fontBox(String type,Color fontColor,backgroundColor,VoidCallback onClick){
    return InkWell(
      onTap: onClick,
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              border: Border.all(color: Colors.white, width: 1)),
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child:RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "FONT SIZE\n",
              style: TextStyle(
                  color:fontColor,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize * 4
              ),
              children: <TextSpan>[
                TextSpan(
                  text: type,
                  style: TextStyle(
                      color: fontColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize *6
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
