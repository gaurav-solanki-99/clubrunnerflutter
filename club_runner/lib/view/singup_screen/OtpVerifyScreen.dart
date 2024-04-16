import 'package:club_runner/util/custom_view/CustomView.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../util/my_color/MyColor.dart';
import '../../util/size_config/SizeConfig.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  TextEditingController otpController = TextEditingController();
  var verified = false.obs;


  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
              child: Column(
                children: [
                  CustomView.customAppBar(
                      MyString.verify_var, MyString.email_single_var, heightPerBox!,
                          fontSize,
                          () {
                        Get.back();
                      }),
                  SizedBox(
                    height: heightPerBox! * 5,
                  ),
                  verified.value?
                  Column(
                    children: [
                      theTextShow(MyString.verified_var, FontWeight.w500, widthPerBox! * 6),
                      SizedBox(
                        height: heightPerBox! * 3,
                      ),
                      theTextShow(MyString.you_can_processed_var, FontWeight.w200,
                          widthPerBox! * 3),
                      SizedBox(
                        height: heightPerBox! * 5,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: heightPerBox!*1.7),
                        child: CustomView.buttonShow(MyString.login_now_var, FontWeight.w400, widthPerBox!,fontSize,  MyColor.app_pink_color, () {
                          Get.offAllNamed(RouteHelper.getWelcomeScreen());
                        }),
                      ),
                    ],
                  ):
                  Column(
                    children: [
                      theTextShow(
                          MyString.enter_4_digit_var, FontWeight.w500, widthPerBox! * 6),
                      SizedBox(
                        height: heightPerBox! * 3,
                      ),
                      theTextShow(MyString.verification_code_send_var, FontWeight.w200,
                          widthPerBox! * 3),
                      SizedBox(
                        height: heightPerBox!,
                      ),
                      theTextShow("Personsname@theiremail.com", FontWeight.w300,
                          widthPerBox! * 3),
                      SizedBox(
                        height: heightPerBox!,
                      ),
                      theTextShow(MyString.the_code_will_expire_var, FontWeight.w200,
                          widthPerBox! * 3),
                      SizedBox(
                        height: heightPerBox! * 7,
                      ),
                      otpFrom(heightPerBox!*1.7),
                      SizedBox(
                        height: heightPerBox! * 5 ,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: heightPerBox!*1.7),
                        child: CustomView.buttonShow(MyString.submit_var, FontWeight.w400, widthPerBox!,fontSize,  MyColor.app_pink_color, () {
                          if(validation()){
                            verified.value =  true;
                          }
                        }),
                      ),

                      SizedBox(
                        height: heightPerBox! * 3 ,
                      ),
                      Text(
                        MyString.or_resend_code_var,
                        style:
                        MyTextStyle.textStyle(FontWeight.w300, widthPerBox! * 3.7,MyColor.app_white_color),
                      ),
                      SizedBox(
                        height: heightPerBox! * 4 ,
                      ),

                      theTextShow(MyString.check_your_spam_var, FontWeight.w200,
                          widthPerBox! * 3),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget theTextShow(String text, FontWeight fontWeight, double size) {
    return Text(
      text,
      style: MyTextStyle.textStyle(fontWeight, size,MyColor.app_white_color),
      textAlign: TextAlign.center,
    );
  }

  Widget otpFrom(double padding){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: heightPerBox! *9,
            fieldWidth: heightPerBox! *7,
            activeFillColor: Colors.white,
            inactiveColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
            selectedColor: Colors.white,
            activeColor: Colors.white),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        backgroundColor: Colors.transparent,
        controller: otpController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          print("Completed  $v");
        },
        onChanged: (value) {
          print(value);
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");

          return true;
        },
        appContext: Get.context!,
      ),
    );
  }

  bool validation(){

    if(otpController.text.isEmpty){
      CustomView.showToast("Enter otp");
    }else if(otpController.text.trim().length < 4){
      CustomView.showToast("invalid otp");
    }else{
      return true;
    }

    return false;
  }
}
