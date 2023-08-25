import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class ApiProvider {
  var headers = {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future<dynamic> post(String requestUrl, Map body) async {
    dynamic responseJson;
    try {
      try {
        var url = Uri.parse(requestUrl);
        final response =
        await http.post(url, body: jsonEncode(body), headers: headers);
        responseJson = _response(response);
        return responseJson;
      } catch (error) {
        if (kDebugMode) {}
        rethrow;
      }
    } on SocketException {
      throw FetchDataException("No Internet");
    }
  }

  Future<dynamic> put(String requestUrl, Map body) async {
    dynamic responseJson;
    try {
      try {
        var url = Uri.parse(requestUrl);
        final response =
        await http.put(url, body: jsonEncode(body), headers: headers);
        responseJson = _response(response);
        return responseJson;
      } catch (error) {
        if (kDebugMode) {}
        rethrow;
      }
    } on SocketException {
      throw FetchDataException("No Internet");
    }
  }

  Future<dynamic> get(String requestUrl, [String? token, Map? body]) async {
    dynamic responseJson;
    try {
      try {
        var url = Uri.parse(requestUrl);
        if (kDebugMode) {}
        final response = await http.get(url, headers: headers);
        responseJson = _response(response);
        if (kDebugMode) {}
        return responseJson;
      } catch (error) {
        if (kDebugMode) {}
        rethrow;
      }
    } on SocketException {
      throw FetchDataException("No Internet");
    }
  }

  Future<dynamic> delete(String requestUrl, [String? token, Map? body]) async {
    dynamic responseJson;
    try {
      try {
        var url = Uri.parse(requestUrl);
        final response =
        await http.delete(url, body: jsonEncode(body), headers: headers);
        responseJson = _response(response);
        return responseJson;
      } catch (error) {
        if (kDebugMode) {}
        rethrow;
      }
    } on SocketException {
      throw FetchDataException("No Internet");
    }
  }

  Future<dynamic> multiPart(
      String requestUrl, Map body, File documentFile) async {
    dynamic responseJson;
    try {
      try {
        var url = Uri.parse(requestUrl);
        http.MultipartRequest request = http.MultipartRequest('POST', url)
          ..fields['additionalInfo'] = jsonEncode(body)
          ..files
              .add(await http.MultipartFile.fromPath('0', documentFile.path));
        responseJson = await request.send();
        responseJson = await multiPartResponse(responseJson);
        return responseJson;
      } catch (error) {
        rethrow;
      }
    } on SocketException {
      throw FetchDataException("No Internet");
    }
  }

  dynamic multiPartResponse(var response) async {
    switch (response.statusCode) {
      case 200:
        final responseString = await response.stream.bytesToString();
        var responseJson = json.decode(responseString);
        return responseJson;
      case 204:
        final responseString = await response.stream.bytesToString();
        var responseJson = json.decode(responseString);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw BadResponseException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        var responseJson = json.decode(response.body.toString());
        if (responseJson["message"].toString() == "Unauthorized access") {
          // return showDialog(
          //     barrierDismissible: false,
          //     context: navigatorKey.currentContext!,
          //     builder: (context) => UnauthorizedUserPopup()
          // );
          break;
        } else {
          throw UnauthorisedException(response.body.toString());
        }
      case 500:
        throw BadResponseException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
