import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../my_color/MyColor.dart';
import '../size_config/SizeConfig.dart';
import '../text_style/MyTextStyle.dart';

//Rishabh 12-March-2024
class CustomView {

  static Widget editTextFiled(TextEditingController controller,
      TextInputType inputType, String hintText, Icon iconShow, double padding,double fontSizeShow,bool readOnly,Function() onTap) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        controller: controller ,
        keyboardType: inputType,
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
            hintText: hintText,
            border: InputBorder.none,
            hintStyle:  TextStyle(fontWeight: FontWeight.w300, fontSize: fontSizeShow * 3.8),
            prefixIcon: iconShow,
            contentPadding:
                const EdgeInsets.symmetric(vertical:10, horizontal: 10)),
      ),
    );
  }

  //Button
  static Widget buttonShow(String buttonText, FontWeight fontWeight,
      double widthPerBox,fontSizeShow,Color myColor ,VoidCallback onPressedFun) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: ElevatedButton(
        onPressed: onPressedFun,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(myColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widthPerBox),
                ),
              ),
            ),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: widthPerBox * 2.4))
        ),
        child: Text(
          buttonText,
          style: MyTextStyle.buttonTextStyle(fontWeight, fontSizeShow * 4),
        ),
      ),
    );
  }

  static Widget buttonShowWithdifferentTextStyle(String buttonText1,buttonText2, FontWeight fontWeight1,fontWeight2,
      double widthPerBox,fontSizeShow,Color myColor ,VoidCallback onPressedFun) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: ElevatedButton(
        onPressed: onPressedFun,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(myColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widthPerBox),
                ),
              ),
            ),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: widthPerBox * 2.4))
        ),
        child: differentStyleTextTogether(buttonText1, fontWeight1, buttonText2, fontWeight2, fontSizeShow, MyColor.app_white_color),

      ),
    );
  }


  //Transparent button
  static Widget transparentButton(String buttonText, FontWeight fontWeight,
      double widthPerBox,fontSizeShow,Color showColor,VoidCallback onPressedFun) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: TextButton(
        onPressed: onPressedFun,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widthPerBox),
                ),
              ),
            ),
            side: MaterialStateProperty.all(BorderSide(color: MyColor.app_black_color)),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: widthPerBox * 2.4))
        ),
        child: Text(
          buttonText,
          style:TextStyle(
              color: MyColor.app_black_color,
              fontFamily: "Poppins",
              fontWeight: fontWeight,
              fontSize: fontSizeShow * 4,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      )
    );
  }

  //for Social Login Button
  static Widget socialButton(
      String assetsImage, double widthPerBox, heightPerBox, VoidCallback onTapFun) {
    return InkWell(
      onTap: onTapFun,
      child: Card(
        color: MyColor.app_white_color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(widthPerBox +5))),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: heightPerBox*1.4),
          child: Image.asset(
            assetsImage,
            height: heightPerBox * 3.4,
          ),
        ),
      ),
    );
  }

  //for different type text together
  static Widget differentStyleTextTogether(String firstText,FontWeight fontWeightFirst,String firstSecond,
      FontWeight fontWeightSecond,double fontSizeShow,Color myColor){
    return  RichText(
      text: TextSpan(
        text: firstText,
        style: MyTextStyle.textStyle(
            fontWeightFirst, fontSizeShow,myColor),
        children: <TextSpan>[
          TextSpan(
            text: firstSecond,
            style: MyTextStyle.textStyle(
                fontWeightSecond, fontSizeShow,myColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }


  //For SnackBar message
static showToast(String msg){
    return Get.showSnackbar(
      GetSnackBar(
        message: msg,
        messageText: Text(msg, style: MyTextStyle.textStyle(FontWeight.w300, 15,MyColor.app_white_color),),
        duration: const Duration(seconds: 2),
        padding:const EdgeInsets.symmetric(horizontal:20,vertical: 13),
        backgroundColor: Colors.black.withOpacity(0.4),
        snackStyle: SnackStyle.GROUNDED,
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),

      ),
    );
}

//For custom appbar
static Widget customAppBar(String firstText ,secondText,double heightPerBox,fontSize,VoidCallback onClick){
    return Column(
      children: [
        SizedBox(
          height: heightPerBox * 8,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                color: MyColor.app_white_color, // Button color
                child: InkWell(
                  onTap: onClick,
                  child: Icon(Icons.arrow_back_ios_new,color: MyColor.screen_bg,size: heightPerBox*2,),
                ),
              ),
            ),
            Expanded(child:Center(child: CustomView.differentStyleTextTogether(firstText, FontWeight.bold,secondText, FontWeight.w300, fontSize! * 5,MyColor.app_white_color)))
          ],
        )
      ],
    );
}


//For Date show
  static Widget cardViewDateClick(String title,double fontSize,Rx<DateTime>currentDate,Color myColor ,Function() decrementClick, incrementClick,){
    return  Card(
      color: myColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.zero,
      elevation: 3,
      child: Obx( () {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: MyTextStyle.textStyle(
                  FontWeight.w700, fontSize * 4, MyColor.app_white_color),),
            ),
            Divider(
              color: MyColor.screen_bg,
              thickness: 2,
              height: 0,
            ),
            Card(
              color: MyColor.app_white_color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5.0))),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 7),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: InkWell(
                        onTap: decrementClick,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5, right: 2),
                          decoration: BoxDecoration(
                              color: MyColor.screen_bg,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5))
                          ),
                          child: Icon(Icons.arrow_back_ios,
                            color: MyColor.app_white_color,),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(DateFormat('EEEE').format(currentDate.value!),
                            style: MyTextStyle.textStyle(
                                FontWeight.w600, fontSize * 3.5,
                                MyColor.screen_bg),),
                          Text(DateFormat('d MMMM yyyy').format(
                              currentDate.value!), style: MyTextStyle.textStyle(
                              FontWeight.w400, fontSize * 4,
                              MyColor.screen_bg),),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: InkWell(
                        onTap: incrementClick,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(
                              left: 5, top: 5, bottom: 5, right: 5),
                          decoration: BoxDecoration(
                              color: MyColor.screen_bg,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5))
                          ),
                          child: Icon(Icons.arrow_forward_ios,
                            color: MyColor.app_white_color,),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        );
      }
      ),
    );
  }



///Diksha
  static Widget profileTextFiled(TextEditingController controller,
      TextInputType inputType, String hintText, double padding,fontSizeShow ,bool readOnly) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      readOnly: readOnly,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          filled: true,
          fillColor: MyColor.app_text_box_bg_color,
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: MyColor.app_border_grey_color, width: 0.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide:
            BorderSide(color: MyColor.app_border_grey_color, width: 0.0),
            borderRadius: BorderRadius.circular(5.0),
          ) ,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: fontSizeShow,color: MyColor.app_hint_color),
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),),
    );
  }


  static Widget customAppBarWithDrawer(double heightPerBox,VoidCallback onClick1,VoidCallback onClick2){
    return Column(
      children: [
        SizedBox(
          height: heightPerBox * 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onClick1,
              child: Container(
                  width: heightPerBox *4.1,
                  height:heightPerBox *4.1,
                  child: Icon(Icons.menu,color: MyColor.app_white_color,size:heightPerBox *3.9)),
            ),
            InkWell(
              onTap: onClick2,
              child: Container(
                  width: heightPerBox *4.1,
                  height:heightPerBox *4.1,
                  child: Icon(Icons.calendar_month_outlined,color: MyColor.app_white_color,size:heightPerBox *3.5)),
            ),
            // Expanded(child:Center(child: CustomView.differentStyleTextTogether(firstText, FontWeight.bold,secondText, FontWeight.w300, heightPerBox! * 2.9)))
          ],
        )
      ],
    );
  }

  static Widget customButtonWithBorder(String text,Function() OnTap,double width){
    var widthPerBox = SizeConfig.blockSizeHorizontalWith;
    var fontSize = SizeConfig.fontSize();
    return GestureDetector(
      onTap: OnTap,
      child: Center(
        child: Container(
          width: width,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(border: Border.all(color: MyColor.app_white_color),borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text,style: MyTextStyle.textStyle(FontWeight.w700, fontSize*3.5, MyColor.app_white_color),textAlign: TextAlign.center,),
              SizedBox(width: widthPerBox,),
              Icon(Icons.arrow_forward_ios,color: MyColor.app_white_color,size: fontSize*3.5,)
            ],
          ),),
      ),
    );
  }

  static Widget membershipStatus(Function() onPressed,String buttonText,Icon icon) {
    var widthPerBox = SizeConfig.blockSizeHorizontalWith;
    var fontSize = SizeConfig.fontSize();
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Column(children: [
       Padding(
         padding: const EdgeInsets.all(5.0),
         child: differentStyleTextTogether("MEMBERSHIP ", FontWeight.w400, "STATUS", FontWeight.w900, 17, MyColor.app_black_color),
       ),
        Divider(),
      SizedBox(
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyColor.app_orange_color),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: widthPerBox! * 2.4))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: MyTextStyle.buttonTextStyle(FontWeight.w600, fontSize * 4),
                ),
                SizedBox(width: 3,),
                icon
                // Icon(icon)
              ],
            ),
          ),
        ),
      ),

      ],),
    );
  }
}
