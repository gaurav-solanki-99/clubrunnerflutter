import 'dart:io';

import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/asstes_image/AssetsImage.dart';
import '../../util/custom_view/SocialCustomView.dart';
import '../../util/my_color/MyColor.dart';
import '../../util/size_config/SizeConfig.dart';
import '../../util/text_style/MyTextStyle.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  TextEditingController nameTextCTRL = TextEditingController();
  TextEditingController lastNameTextCTRL = TextEditingController();
  TextEditingController emailTextCTRL = TextEditingController();
  TextEditingController yourPassTextCTRL = TextEditingController();
  TextEditingController confirmPassTextCTRL = TextEditingController();

  var _passwordVisible = false.obs;
  var _passwordVisibleSecond = false.obs;
  var checked = true.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
          child: Column(
            children: [
              CustomView.customAppBar(MyString.sing_var, MyString.up_var, heightPerBox!,fontSize,(){
               Get.back();
              }),
              SizedBox(
                height:heightPerBox! *4.5 ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Create your ",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*4.5, MyColor.app_white_color),),Image.asset(MyAssetsImage.app_trainza_img,width: 90,),Text(" Account",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*4.5, MyColor.app_white_color))],),
              SizedBox(
                height:heightPerBox! *4.5 ,
              ),
             Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding! - 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("FIRST NAME",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*3.5, MyColor.app_white_color),),
                    CustomView.editTextFiled(nameTextCTRL, TextInputType.text, MyString.first_name_var,  Icon(Icons.person_outline,color: MyColor.app_hint_color,), widthPerBox!,fontSize,false,(){}),
                    SizedBox(
                      height:heightPerBox! *2 ,
                    ),
                    Text("LAST NAME",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*3.5, MyColor.app_white_color),),
                    CustomView.editTextFiled(lastNameTextCTRL, TextInputType.text, MyString.last_name_var,  Icon(Icons.person_outline,color: MyColor.app_hint_color), widthPerBox!,fontSize,false,(){}),
                    SizedBox(
                      height:heightPerBox! *2 ,
                    ),
                    Text("EMAIL ADDRESS (REQUIRED)",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*3.5, MyColor.app_white_color),),
                    CustomView.editTextFiled(emailTextCTRL, TextInputType.text, MyString.email_var,  Icon(Icons.email_outlined,color: MyColor.app_hint_color), widthPerBox!,fontSize,false,(){}),
                    SizedBox(
                      height:heightPerBox! *2 ,
                    ),
                    Text("MOBILE NUMBER (REQUIRED)",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*3.5, MyColor.app_white_color),),
                    SizedBox(
                      height:heightPerBox! *2 ,
                    ),
                    Text("PASSWORD (REQUIRED)",style: MyTextStyle.textStyle(FontWeight.w600, fontSize*3.5, MyColor.app_white_color),),
                    passwordTextFiled(yourPassTextCTRL,_passwordVisible,MyString.password_var),
                    SizedBox(
                      height:heightPerBox! *2 ,
                    ),
                    passwordTextFiled(confirmPassTextCTRL,_passwordVisibleSecond, MyString.confirm_password_var),
                    SizedBox(
                      height:heightPerBox! *2.3 ,
                    ),
                    checkBox(widthPerBox!),
                    SizedBox(
                      height:heightPerBox! *2.3 ,
                    ),
                    CustomView.buttonShow(MyString.register_now_var, FontWeight.w400, widthPerBox!,fontSize,  MyColor.app_pink_color, () {
                      if(validation()){
                       Get.toNamed(RouteHelper.getOtpVerifyScreen());
                      }
                    }),

                    SizedBox(
                      height:heightPerBox! *2.2 ,
                    ),
                    Text(
                      MyString.or_sign_up_with_var,
                      style:
                      MyTextStyle.textStyle(FontWeight.w300, widthPerBox! * 3.7,MyColor.app_white_color),
                    ),

                    SizedBox(
                      height:heightPerBox! *2.2 ,
                    ),
                    socialLogin( widthPerBox!, heightPerBox),
                    SizedBox(
                      height:heightPerBox! *2.3 ,
                    ),


                    InkWell(
                        onTap: () {
                         Get.back();
                        },
                        child:CustomView.differentStyleTextTogether(MyString.already_registered_var,  FontWeight.w300,
                            MyString.sign_in_var, FontWeight.w700, widthPerBox! * 3.7,MyColor.app_white_color)

                    ),
                    SizedBox(
                      height:heightPerBox! *5 ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap:(){
                              print("Terms of use");
                              _launchURL("https://www.google.com/");
                            } ,
                            child: Text(MyString.terms_of_use_var,style: MyTextStyle.textStyle(FontWeight.w300, 12,MyColor.app_white_color),)),
                         InkWell(
                             onTap:(){
                               print("Privacy Policy");
                               _launchURL("https://www.google.com/");
                             } ,
                             child: Text(MyString.privacy_Policy_var,style: MyTextStyle.textStyle(FontWeight.w300, 12,MyColor.app_white_color),)),
                         InkWell(
                             onTap:(){
                               print("Contact");
                               _launchURL("https://www.google.com/");
                             } ,
                             child: Text(MyString.contact_var ,style: MyTextStyle.textStyle(FontWeight.w300, 12,MyColor.app_white_color),)),
                      ],
                    ),
                    SizedBox(
                      height:heightPerBox! *5 ,
                    ),
                  ],
                ),
              )

            ],
          ),
        ),

      ),
    );
  }

  Widget passwordTextFiled(TextEditingController controller,RxBool _passwordVisible,String hintText){
    return Obx(() {
      return  TextFormField(
        controller: controller ,
        obscureText: !_passwordVisible.value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            fillColor: MyColor.app_text_box_bg_color,
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: MyColor.app_text_box_bg_color, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide:
              BorderSide(color: MyColor.app_text_box_bg_color, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
            ) ,
            hintText:hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
            prefixIcon:  Icon(Icons.lock_outline,color: MyColor.app_hint_color,),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: MyColor.screen_bg,
              ),
              onPressed: () {
                _passwordVisible.value = !_passwordVisible.value;
              },
            ),

            contentPadding:
            EdgeInsets.symmetric(vertical: widthPerBox! * 2, horizontal: 10)),
      );
    });
  }

  Widget checkBox(double widthPerBox) {
    return  Obx(() {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: ListTileTheme(
          horizontalTitleGap: 0,
          child: CheckboxListTile(
            side: const BorderSide(color: Colors.white),
            title: Text(
              MyString.accept_terms_var,
              style:
              MyTextStyle.textStyle(FontWeight.w300, widthPerBox * 2.5,MyColor.app_white_color),
            ),
            activeColor: Colors.white,
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
        Platform.isIOS? Expanded(
          flex: 1,
          child: CustomView.socialButton(
              MyAssetsImage.app_apple_logo, widthPerBox, heightPerBox, () {
            signInWithApple();
            print("Apple");
          }),
        ):Container(),
        Expanded(
          flex: 1,
          child: CustomView.socialButton(
              MyAssetsImage.app_twitter_logo, widthPerBox, heightPerBox, ()  {
            signInWithTwitter();
          }),
        ),
      ],
    );
  }

  _launchURL(String data) async {
    final Uri url = Uri.parse(data);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }



  bool validation() {

    if(nameTextCTRL.text.isEmpty){
      CustomView.showToast("enter first name");
    }else if(lastNameTextCTRL.text.isEmpty){
      CustomView.showToast("enter last name");
    }
    else if (emailTextCTRL.text.isEmpty) {
      CustomView.showToast("enter email");
    } else if (!emailTextCTRL.text.trim().isEmail) {
      CustomView.showToast("enter valid email");
    }else if (emailTextCTRL.text.trim().length > 50) {
      CustomView.showToast("email should be upto 50 characters");
    }
    else if (yourPassTextCTRL.text.isEmpty) {
      CustomView.showToast("enter password");
    } else if (yourPassTextCTRL.text.trim().length < 8) {
      CustomView.showToast("please enter at least 8 digit password");
    } else if (!MyString.regex.hasMatch(yourPassTextCTRL.text)) {
      CustomView.showToast(
          "Text should contains uppercase letter,special symbol and number");
    } else if (yourPassTextCTRL.text.trim().length > 30) {
      CustomView.showToast("password should be upto 30 characters");
    }else if(confirmPassTextCTRL.text.trim().isEmpty){
      CustomView.showToast("enter repeated password");
    }
    else if(confirmPassTextCTRL.text.trim().toString() != yourPassTextCTRL.text.trim().toString()){
      CustomView.showToast("password must be same");
    }else if(!checked.value){
      CustomView.showToast("accept terms and conditions");
    }
    else {
      return true;
    }
    return false;
  }


}
