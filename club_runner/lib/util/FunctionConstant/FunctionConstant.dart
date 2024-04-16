import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../local_storage/LocalStorage.dart';

class commonFunction{

 static Future<String?> getdeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    LocalStorage sp = LocalStorage();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;

      LocalStorage.setStringValue(sp.deviceId, iosDeviceInfo.identifierForVendor!);

      print(">>>>>>>>>>>>>>Get ${LocalStorage.getStringValue(sp.deviceId)}");
      print("iosDeviceInfo ${iosDeviceInfo.identifierForVendor}");

      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;

      LocalStorage.setStringValue(sp.deviceId, androidDeviceInfo.id);

      print(">>>>>>>>>>>>>>Get ${LocalStorage.getStringValue(sp.deviceId)}");
      print("androidDeviceInfo ${androidDeviceInfo.id}");

      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }


  static getdeviceToken(){
    FirebaseMessaging.instance.getToken().then((value) {
      String? devicetoken = value;
      LocalStorage sp = LocalStorage();
      LocalStorage.setStringValue(sp.deviceToken, devicetoken!);

      print(">>>>>>>>>>>>>> $devicetoken");
      print(">>>>>>>>>>>>>>Get ${LocalStorage.getStringValue(sp.deviceToken)}");
    });
  }




}


