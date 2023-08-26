import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 75)));
  var headers = {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future<dynamic> get(String requestUrl, [Map? body]) async {
    dynamic jsonResponse;
    try {
      log("requestUrl==========>$requestUrl");
      final response =
          await dio.get(requestUrl, options: Options(headers: headers));
      jsonResponse = (response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        e.response!.statusCode;
        e.response!.data;
      } else {
        e.message.toString();
      }
    }
    return jsonResponse;
  }

  Future<dynamic> post(String requestUrl, Map? body) async {
    dynamic jsonResponse;
    try {
      final response = await dio.post(requestUrl,
          data: body, options: Options(headers: headers));
      jsonResponse = (response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        e.response!.statusCode;
        e.response!.data;
      } else {
        e.message.toString();
      }
    }
    return jsonResponse;
  }

  Future<dynamic> put(String requestUrl, Map? body) async {
    dynamic jsonResponse;
    try {
      final response = await dio.put(requestUrl,
          data: body, options: Options(headers: headers));
      jsonResponse = (response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        e.response!.statusCode;
        e.response!.data;
      } else {
        e.message.toString();
      }
    }
    return jsonResponse;
  }

  Future<dynamic> multiPart(
      String requestUrl, File imageFile, String hashCode) async {
    dynamic jsonResponse;
    try {
      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
        'hashcode': MultipartFile.fromString(hashCode)
      });
      final response = await dio.post(requestUrl,
          data: formData, options: Options(headers: headers));
      jsonResponse = jsonDecode(response.toString());
    } on DioException catch (e) {
      if (e.response != null) {
        e.response!.statusCode;
        e.response!.data;
      } else {
        e.message.toString();
      }
    }
    return jsonResponse;
  }
}
