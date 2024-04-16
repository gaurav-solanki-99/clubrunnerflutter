import 'dart:async';
import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/local_storage/LocalStorage.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import '../../util/size_config/SizeConfig.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  LocalStorage localStorage = LocalStorage();
  bool isLogin = false;
  var fontSizeType = "medium";
  @override
  void initState() {
    isLogin = LocalStorage.getBoolValue(localStorage.isLogin);
    super.initState();
    print("isLogin :---- $isLogin");
    if(LocalStorage.getStringValue(localStorage.fontSizeType) != ""){
     fontSizeType = LocalStorage.getStringValue(localStorage.fontSizeType);
    }
    print("fontSizeType :---- $fontSizeType");

    Timer(
        Duration(seconds: 2), ()=> navigate()
    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context,fontSizeType);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height:130,
                  width:130,
                  child: Image.asset(MyAssetsImage.app_logo)),
            ],
          ),
        ),
      ),
    );
  }


  void navigate(){
    if(isLogin){
      Get.offAllNamed(RouteHelper.getMainScreen());
    }else{
      Get.offAllNamed(RouteHelper.getWelcomeScreen());
    }
  }
}
