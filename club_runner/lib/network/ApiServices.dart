import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../util/local_storage/LocalStorage.dart';

class MyApiService extends GetxService {
  static var BASEURL = "https://api.flof.ca/v1";
  LocalStorage sp = LocalStorage();
  static dio.Dio _dio = dio.Dio();

  @override
  void onInit() {
    Platform.isIOS
        ? LocalStorage.setStringValue(sp.deviceType, "2")
        : LocalStorage.setStringValue(sp.deviceType, "1");
    super.onInit();
  }

  static getDefaultHeader() {
    Map<String, String> defaultHeaders = {
      "device-token": LocalStorage.getStringValue("deviceToken"),
      "device-type": LocalStorage.getStringValue("deviceType"),
      "device-id": LocalStorage.getStringValue("deviceId"),
      "api-key": "5apd476956dsfhgha23646984asdfasd",
      "accept": "application/json"
    };

    return defaultHeaders;
  }

  static getAllHeaders() {
    Map<String, String> allHeaders = {
      "access-token": LocalStorage.getStringValue("TOKEN"),
      "device-token": LocalStorage.getStringValue("deviceToken"),
      "device-type": LocalStorage.getStringValue("deviceType"),
      "device-id": LocalStorage.getStringValue("deviceId"),
      "api-key": "5apd476956dsfhgha23646984asdfasd",
      "accept": "application/json"
    };

    return allHeaders;
  }

  static Future<http.Response?> postApiwithHttp(
      String endpoint, Map<String, String>? formData, var headers) async {
    print("Headers " + getDefaultHeader().toString());
    try {
      final response = await http.post(
        Uri.parse(MyApiService.BASEURL + endpoint),
        body: formData,
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Success Api Call " + response.body);

        return response;
      } else {
        print("Else Login" + response.body);
        final responseBody = response.body;
        // print(responseData);
        return null;
      }
    } catch (e) {
      print("EXCECPTION" + e.toString());
      return null;
    }
  }

  static Future<dio.Response?> postApiwithDio(String endpoint,
      Map<String, dynamic>? formData, Map<String, dynamic>? headers) async {
    print("Headers " + getDefaultHeader().toString());

    try {
      final _dio = dio.Dio();
      final response = await _dio.post(
        BASEURL + endpoint,
        data: formData,
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print("Success Api Call " + response.data.toString());
        return response;
      } else {
        print("Else Login" + response.data.toString());
        return null;
      }
    } catch (e) {
      print("EXCEPTION" + e.toString());
      return null;
    }
  }

  static Future<http.Response?> getApiwithHttp(
      String endpoint, var headers) async {
    print("Headers " + getDefaultHeader().toString());
    try {
      final response = await http.get(
        Uri.parse(MyApiService.BASEURL + endpoint),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Success Api Call " + response.body);

        return response;
      } else {
        print("Else Login" + response.body);
        final responseBody = response.body;
        // print(responseData);
        return null;
      }
    } catch (e) {
      print("EXCECPTION" + e.toString());
      return null;
    }
  }

  static Future<dio.Response?> getApiwithDio(
      String endpoint, Map<String, dynamic>? headers) async {
    print("Headers " + getDefaultHeader().toString());
    try {
      final _dio = dio.Dio();
      final response = await _dio.get(
        BASEURL + endpoint,
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print("Success Api Call " + response.data.toString());
        return response;
      } else {
        print("Else Login" + response.data.toString());
        return null;
      }
    } catch (e) {
      print("EXCEPTION" + e.toString());
      return null;
    }
  }


  static Future<String?> httpmultipart(String endpoint,
      Map<String, String>? formData, File? file, var headers) async {
    print("Headers " + getDefaultHeader().toString());
    try {

      final request = http.MultipartRequest(
          'POST', Uri.parse(MyApiService.BASEURL + endpoint));

      request.headers.addAll(headers);

      request.fields.addAll(formData!);

// Add the file using MultipartFile.fromPath

      print("File>>" + file.toString());
      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'profile_img', file.path.toString()));
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();

        print("Success Api Call " + responseBody.toString());

        return responseBody.toString();
      } else {
// print("Else Login" + response.body);
// final responseBody = response.body;
// print(responseData);

        return null;
      }
    } catch (e) {
      print("EXCECPTION" + e.toString());
      return null;
    }
  }


  // static Future<dio.Response?> multipartpostApiwithDio(String endpoint, Map<String, dynamic>? formData, Map<String, dynamic>? headers) async {
  //   print("Headers " + getDefaultHeader().toString());
  //
  //   try {
  //     final _dio = dio.Dio();
  //     final formDataToSend = dio.FormData.fromMap(formData!);
  //
  //     // Append each formData entry
  //     formData.forEach((key, value) {
  //       if (value is File) {
  //         formDataToSend.files.add(dio.MultipartFile.fromFileSync(value.path, filename: value.path.split('/').last) as MapEntry<String, dio.MultipartFile>);
  //       } else {
  //         formDataToSend.fields.add(MapEntry(key, value.toString()));
  //       }
  //     });
  //
  //     final response = await _dio.post(
  //       BASEURL + endpoint,
  //       data: formDataToSend,
  //       options: dio.Options(headers: headers),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print("Success Api Call " + response.data.toString());
  //       return response;
  //     } else {
  //       print("Else Login" + response.data.toString());
  //       return null;
  //     }
  //   } catch (e) {
  //     print("EXCEPTION" + e.toString());
  //     return null;
  //   }
  // }
}
