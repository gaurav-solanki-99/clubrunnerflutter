import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/local_storage/LocalStorage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/size_config/SizeConfig.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/custom_view/SocialCustomView.dart';

//Rishabh 12-March-2024
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LocalStorage sp = LocalStorage();

  var fontSize = SizeConfig.fontSize();

  var checked = false.obs;

  @override
  Widget build(BuildContext context) {
    var heightPerBox = SizeConfig.blockSizeVerticalHeight;
    var widthPerBox = SizeConfig.blockSizeHorizontalWith;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal:SizeConfig.scrollViewPadding!),
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: heightPerBox! * 10,
                ),
                SizedBox(
                  height: widthPerBox! * 40,
                  width: widthPerBox * 40,
                  child: Image.asset(
                    MyAssetsImage.app_trainza_img,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: heightPerBox * 2,
                ),
                CustomView.differentStyleTextTogether(MyString.welcome_var,  FontWeight.bold,
                    MyString.back_var, FontWeight.w200, fontSize * 6,MyColor.app_white_color),
                SizedBox(
                  height: heightPerBox * 2,
                ),
                CustomView.editTextFiled(
                    emailController,
                    TextInputType.emailAddress,
                    MyString.email_var,
                     Icon(Icons.mail_outline,color: MyColor.app_hint_color,),
                    widthPerBox,fontSize,false,(){}),
                SizedBox(
                  height: heightPerBox + 5,
                ),
                CustomView.editTextFiled(
                    passController,
                    TextInputType.text,
                    MyString.password_var,
                     Icon(Icons.lock_outline,color: MyColor.app_hint_color,),
                    widthPerBox,fontSize,false,(){}),
                checkBox(fontSize),
                SizedBox(
                  height: heightPerBox * 2,
                ),
                CustomView.buttonShow(
                    MyString.login_var, FontWeight.w400, widthPerBox,fontSize,  MyColor.app_pink_color, () {
                  if (validation()) {
                   Get.offNamed(RouteHelper.getMainScreen());
                   LocalStorage.setBoolValue(sp.isLogin, true);
                  }
                }),
                SizedBox(
                  height: heightPerBox * 5,
                ),
                Text(
                  MyString.login_with_var,
                  style:
                      MyTextStyle.textStyle(FontWeight.w300, fontSize * 3.7,MyColor.app_white_color),
                ),
                SizedBox(
                  height: heightPerBox + 5,
                ),
                socialLogin(widthPerBox, heightPerBox),
                SizedBox(
                  height: heightPerBox + 5,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteHelper.getSingUpScreen());
                  },
                  child:CustomView.differentStyleTextTogether(MyString.new_here_var,  FontWeight.w300,
                      MyString.sing_up_var, FontWeight.w700, fontSize * 3.7,MyColor.app_white_color)

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkBox(double widthPerBox) {
    return Obx(() {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTileTheme(
                horizontalTitleGap: 0,
                child: CheckboxListTile(
                  side: const BorderSide(color: Colors.white),
                  title: Text(
                    MyString.remember_var,
                    style:
                        MyTextStyle.textStyle(FontWeight.w300, widthPerBox * 3,MyColor.app_white_color),
                  ),
                  value: checked.value,
                  onChanged: (newValue) {
                    checked.value = newValue!;
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  checkColor: MyColor.screen_bg,
                  fillColor: MaterialStateProperty.all(checked.value ?MyColor.app_white_color: MyColor.screen_bg),
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                MyString.forgot_pass_var,
                style: MyTextStyle.textStyle(FontWeight.w300, widthPerBox * 3,MyColor.app_white_color),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget socialLogin(double widthPerBox, heightPerBox) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomView.socialButton(
              MyAssetsImage.app_google_logo, widthPerBox, heightPerBox, () {
            signInWithGoogle();
            print("Google");
          }),
        ),
        Expanded(
          flex: 1,
          child: CustomView.socialButton(
              MyAssetsImage.app_apple_logo, widthPerBox, heightPerBox, () {
            signInWithApple();
            print("Apple");
          }),
        ),
        Expanded(
          flex: 1,
          child: CustomView.socialButton(
              MyAssetsImage.app_twitter_logo, widthPerBox, heightPerBox, () {
            print("Twitter");
            signInWithTwitter();
          }),
        ),
      ],
    );
  }

  bool validation() {
    if (emailController.text.isEmpty) {
      CustomView.showToast("enter email");
    } else if (!emailController.text.trim().isEmail) {
      CustomView.showToast("enter valid email");
    }else if (emailController.text.trim().length > 50) {
      CustomView.showToast("email should be upto 50 characters");
    }
    else if (passController.text.isEmpty) {
      CustomView.showToast("enter password");
    } else if (passController.text.trim().length < 8) {
      CustomView.showToast("please enter at least 8 digit password");
    } else if (!MyString.regex.hasMatch(passController.text.trim())) {
      CustomView.showToast(
          "Text should contains uppercase letter,special symbol and number");
    } else if (passController.text.trim().length > 30) {
      CustomView.showToast("password should be upto 30 characters");
    }
    else {
      return true;
    }
    return false;
  }
}
