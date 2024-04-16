
import 'package:get_storage/get_storage.dart';

class LocalStorage {

  static final localStorage = GetStorage();

  //Keys
  String isLogin = "isLogin";
  String fontSizeType = "fontSizeType";
  String deviceToken = "deviceToke";
  String deviceType = "deviceType";
  String deviceId = "deviceId";


  //For Storing String value
  static void setStringValue(String key, String value){
    localStorage.write(key, value);
  }

  static String getStringValue(String key){
    return localStorage.read(key)??"";
  }
  //For Storing Bool value
  static void setBoolValue(String key, bool value){
    localStorage.write(key, value);
  }

  static bool getBoolValue(String key){
    return localStorage.read(key)?? false;
  }

  //For Storing Integer value
  static void setNumValue(String key, String value){
    localStorage.write(key, value);
  }

  static int getNumValue(String key){
    return localStorage.read(key);
  }


  //For Storing String value
  static void setListValue(String key, List<dynamic> value){
    localStorage.write(key, value);
  }

  static List<dynamic> getListValue(String key){
    return localStorage.read(key)?? [];
  }


  //For Clear the GetStorage
  static void clearLocalStorage(){
    localStorage.erase();
  }
}