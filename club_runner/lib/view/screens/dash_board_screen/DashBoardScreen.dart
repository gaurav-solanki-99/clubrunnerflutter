import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/bottomnav_common/BottomNavigationBarWidget.dart';
import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/local_storage/LocalStorage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../util/size_config/SizeConfig.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>  {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();
  var version = "".obs;

  //MainScreenController  msc = Get.find();

  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    appVersion();
  }


  appVersion(){
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version.value = packageInfo.version;
      print("version ${version.value}");
    });
  }




  @override
  Widget build(BuildContext context) {
  return Obx((){
     return Scaffold(
       body: SingleChildScrollView(
         padding: EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
         child: SizedBox(
           child: Column(
             mainAxisSize: MainAxisSize.max,
             children: [
               CustomView.customAppBar(
                   MyString.dash_var, MyString.board_var, heightPerBox!,fontSize, () {}),
               SizedBox(
                 height: heightPerBox! * 4,
               ),
               Container(
                 width: SizeConfig.screenWidth,
                 decoration: BoxDecoration(
                     shape: BoxShape.rectangle,
                     borderRadius: const BorderRadius.all(Radius.circular(10)),
                     border: Border.all(color: Colors.white, width: 1)),
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
                                 FontWeight.w300, fontSize! * 4.5,MyColor.app_white_color),
                             overflow: TextOverflow.ellipsis,
                           ),
                           Text(
                             "Ashworth",
                             softWrap: true,
                             style: MyTextStyle.textStyle(
                                 FontWeight.w500, fontSize! * 4.5,MyColor.app_white_color),
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
               ),
               SizedBox(
                 height: heightPerBox! * 2,
               ),
               Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_training_dash_board,
                         MyString.training_var, 1.0, () {}),
                   ),
                   SizedBox(
                     width: widthPerBox!,
                   ),
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_log_book_dash_board,
                         MyString.logbook_var, 1.0, () {}),
                   )
                 ],
               ),
               SizedBox(
                 height: heightPerBox!,
               ),
               Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_result_dash_board,
                         MyString.result_var, 0.6, () {}),
                   ),
                   SizedBox(
                     width: widthPerBox!,
                   ),
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_result_dash_board,
                         MyString.your_pb_var, 1.0, () {Get.toNamed(RouteHelper.getPersonalBestScreen());}),
                   )
                 ],
               ),
               SizedBox(
                 height: heightPerBox!,
               ),
               Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_news_dash_board,
                         MyString.news_var, 0.6, () {}),
                   ),
                   SizedBox(
                     width: widthPerBox!,
                   ),
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_training_dash_board,
                         MyString.events_var, 0.6, () {}),
                   )
                 ],
               ),
               SizedBox(
                 height: heightPerBox!,
               ),
               Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_your_profile_dash_board,
                         MyString.member_var, 0.6, () {
                           Get.toNamed(RouteHelper.getMembersScreen());
                         }),
                   ),
                   SizedBox(
                     width: widthPerBox!,
                   ),
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_your_profile_dash_board,
                         MyString.membership_var, 0.6, () {
                           Get.toNamed(RouteHelper.getMembershipScreen());
                         }),
                   )
                 ],
               ),
               SizedBox(
                 height: heightPerBox!,
               ),
               Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_your_profile_dash_board,
                         MyString.your_profile_var, 1.0, () {
                           Get.toNamed(RouteHelper.getProfileScreen());
                         }),
                   ),
                   SizedBox(
                     width: widthPerBox!,
                   ),
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_login_pass_dash_board,
                         MyString.login_pass_var, 1.0, () {}),
                   )
                 ],
               ),
               SizedBox(
                 height: heightPerBox!,
               ),
               Row(
                 children: [
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_setting_dash_board,
                         MyString.setting_var, 1.0, () {
                           _navigateAndRefresh(context);
                         }),
                   ),
                   SizedBox(
                     width: widthPerBox!,
                   ),
                   Expanded(
                     flex: 1,
                     child: boxShow(MyAssetsImage.app_logout_dash_board,
                         MyString.logout_var, 1.0, ()  {
                           LocalStorage.clearLocalStorage();
                           Get.offAllNamed(RouteHelper.welcomeScreen);
                         }),
                   )
                 ],
               ),
               SizedBox(
                 height: heightPerBox! * 3,
               ),
               Text(
                 MyString.some_features_are_disable_var,
                 style:
                 MyTextStyle.textStyle(FontWeight.w300, fontSize! * 3.5,MyColor.app_white_color),
                 textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: heightPerBox! * 4,
               ),
               CustomView.differentStyleTextTogether(
                   "${MyString.club_var} ",
                   FontWeight.bold,
                   MyString.invites_var,
                   FontWeight.w200,
                   fontSize * 6,MyColor.app_white_color),
               SizedBox(
                 height: widthPerBox! ,
               ),
               Text(
                 MyString.view_and_accepts_var,
                 style:
                 MyTextStyle.textStyle(FontWeight.w200, fontSize * 3.5,MyColor.app_white_color),
                 textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: heightPerBox! * 3,
               ),
               listViewShow(),
               SizedBox(
                 height: heightPerBox! * 2,
               ),
               SizedBox(
                 height: widthPerBox! * 40,
                 width: widthPerBox! * 40,
                 child: Image.asset(
                   MyAssetsImage.app_trainza_img,
                   fit: BoxFit.contain,
                 ),
               ),
               Text(
                 MyString.delete_profile_var,
                 style:
                 TextStyle(
                     decoration: TextDecoration.underline,
                     decorationColor:MyColor.app_white_color ,
                     color: MyColor.app_white_color,
                     fontFamily: "Poppins",
                     fontWeight: FontWeight.w200,
                     fontSize: fontSize *3
                 ),
                 textAlign: TextAlign.center,
               ),
               Text(
                 "${MyString.app_version_var}${version.value}",
                 style: MyTextStyle.textStyle(FontWeight.w300, fontSize * 3,MyColor.app_white_color),
                 textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: heightPerBox! * 2,
               ),
             ],
           ),
         ),
       ),
       //bottomNavigationBar: BottomNavigationBarWidget(),
     );
   });
  }


  Widget boxShow(
      String image, String boxName, double opacity, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Card(
        color: MyColor.app_white_color.withOpacity(opacity),
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Image.asset(
                  image,
                  height: 20,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                    child: Text(
                  boxName,
                  style: TextStyle(
                      fontSize: fontSize * 3.4,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateAndRefresh(BuildContext context) async {
    final result = await Get.toNamed(RouteHelper.getSettingScreen());//or use default navigation
    if(result != null){
     fontSize = SizeConfig.fontSize();
     setState(() {

     });
    }
  }

  Widget listViewShow() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          color: MyColor.app_white_color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Card(
                      elevation: 0.0,
                      color: MyColor.screen_bg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: heightPerBox! * 4),
                        child: Image.asset(
                          MyAssetsImage.app_club_image_dash_board,
                          height: heightPerBox! * 5,
                          width: heightPerBox! * 20,
                        ),
                      )),
                  SizedBox(
                    width: widthPerBox! * 2,
                  ),
                  Flexible(
                    child: Text(
                      "Bedfordview Athletc",
                      style: TextStyle(
                          color: MyColor.screen_bg,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: fontSize * 4),
                    ),
                  )
                ],
              ),
              Card(
                color: Colors.grey.withOpacity(0.5),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 7.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CustomView.transparentButton(
                              MyString.decline_var,
                              FontWeight.w300,
                              widthPerBox!,
                              fontSize,
                              Colors.grey.withOpacity(0.5), () {
                            showDialogBox(
                                MyString.please_var,
                                MyString.confirm_var,
                                MyString.are_you_sure_wish_to_decline_var,
                                MyString.decline_var,
                                () {},
                                () {});
                          })),
                      SizedBox(
                        width: widthPerBox! * 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomView.buttonShow(
                          MyString.accept_var,
                          FontWeight.w300,
                          widthPerBox!,
                          fontSize,
                          MyColor.app_pink_color,
                          () {
                            showDialogBox(
                                MyString.club_var,
                                MyString.confirmed_var,
                                MyString.you_have_accepted_var,
                                MyString.accept_var,
                                () {},
                                () {});
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> showDialogBox(String headingFirstMSG, headingSecondMSG,
      mainMSG, typeOfClick, VoidCallback acceptClick, declineClick) {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.cancel)),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${headingFirstMSG} ",
                        style: MyTextStyle.black_text_welcome_msg_style(
                            FontWeight.w400, fontSize! * 6),
                        children: <TextSpan>[
                          TextSpan(
                            text: headingSecondMSG,
                            style: MyTextStyle.black_text_welcome_msg_style(
                                FontWeight.w600, fontSize! * 6),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightPerBox! * 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mainMSG,
                        style: MyTextStyle.black_text_welcome_msg_style(
                            FontWeight.w400, fontSize! * 3.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: heightPerBox! * 2.6,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CustomView.transparentButton(
                                  typeOfClick == MyString.accept_var
                                      ? "DONE"
                                      : MyString.cancel_var,
                                  FontWeight.w300,
                                  widthPerBox!,
                                  fontSize,
                                  Colors.grey.withOpacity(0.5),
                                  declineClick)),
                          SizedBox(
                            width: widthPerBox! * 2,
                          ),
                          typeOfClick != MyString.accept_var
                              ? Expanded(
                                  flex: 1,
                                  child: CustomView.buttonShow(
                                      MyString.decline_var,
                                      FontWeight.w300,
                                      widthPerBox!,
                                      fontSize,
                                      MyColor.app_pink_color,
                                      acceptClick),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
