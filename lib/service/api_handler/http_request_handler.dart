// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_feeds_app/helpers/shared_preference.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/service/api_handler/http_request_exception.dart';
import 'package:news_feeds_app/widgets/custom_toast/toast_widget.dart';

enum ResponseType {post,get,put,delete,}

class HttpHelper {
  /// TO CALL ANY API [post-get-put-delete]

  Future<dynamic> callService({required String url,required ResponseType responseType,bool authorization=false,var parameter})async{
    http.Response? response;
    Map<String, String> header = {
      'Accept': 'application/json',
      "Content-type": "application/json",
      "language": UserDataFromStorage.languageCodeFromStorage,
      'Authorization': "",
    };
    try {
      switch(responseType){
        case ResponseType.post:
          await http.post(Uri.parse(url),headers:header,body:jsonEncode(parameter)).then((value){
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
        case ResponseType.get:
          await http.get(Uri.parse(url),headers:header).then((value){
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
        case ResponseType.put:
          await http.put(Uri.parse(url),headers:header,body:jsonEncode(parameter)).then((value){
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
        case ResponseType.delete:
          await http.delete(Uri.parse(url),headers:header,body:jsonEncode(parameter)).then((value){
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
      }
    } on SocketException {
      throw InternetException('internet');
    }on TimeoutException{
      throw TimeOutException('');
    }
    return _responseExceptionHandler(response!);
  }

}

///Exception STATUE
dynamic _responseExceptionHandler(http.Response response) {
  debugPrint('check url ${response.request!.url} -- check body ${response.body}');
  switch (response.statusCode) {
  // success response
    case 200:
      return json.decode(response.body);
    case 401:
    case 403:
    debugPrint('Unauthorised Exception');
    ShowToastFunctions.showToast(context: NewsFeedsApp.navigatorKey.currentState!.context, msg: "unAuthErrorMessage");
    // Unauthorised Exception
    // customPushAndRemoveUntil(NewsFeedsApp.navigatorKey.currentState!.context, const SignInSeekerScreen(withBackButton: false,));
    return json.decode(response.body);
    case 404:
    // Not Found Exception
      debugPrint('Not Found 404');

      return json.decode(response.body);
    case 400:
      ShowToastFunctions.showToast(context: NewsFeedsApp.navigatorKey.currentState!.context, msg: "publicErrorMessage");
    // bad request Exception
      debugPrint('bad request or otp wrong=${response.statusCode}');
      return json.decode(response.body);
    case 408:
      ShowToastFunctions.showToast(context: NewsFeedsApp.navigatorKey.currentState!.context, msg: "timeOutErrorMessage");
      // Time Out Exception
      debugPrint('Time Out Exception 408');

      return json.decode(response.body);
    case 204:
      ShowToastFunctions.showToast(context: NewsFeedsApp.navigatorKey.currentState!.context, msg: "timeOutErrorMessage");
     break;

    default:
      ShowToastFunctions.showToast(context: NewsFeedsApp.navigatorKey.currentState!.context, msg: "publicErrorMessage");
  }
}
