import 'dart:io';

import 'package:club_runner/util/FunctionConstant/FunctionConstant.dart';
import 'package:club_runner/util/local_storage/LocalStorage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/size_config/SizeConfig.dart';
import 'package:club_runner/view/splash_screen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';


// Rishabh 12-March-2024
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  commonFunction.getdeviceId();
  commonFunction.getdeviceToken();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Club Runner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColor.screen_bg),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
       scaffoldBackgroundColor: MyColor.screen_bg,

        textSelectionTheme: TextSelectionThemeData(
            cursorColor: MyColor.app_black_color
        ),

        useMaterial3: true,
      ),
     defaultTransition: Transition.cupertino,
     initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.pageList,
    );
  }
}



