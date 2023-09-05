import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';


/// Normal push navigation
 customPushNavigator(context ,Widget page) async {
  if (kIsWeb) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        reverseTransitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
              opacity: animation,
              child:page,
            ),
      ),
    );
  }
  else{
    if(Platform.isAndroid){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
    if(Platform.isIOS){
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => page),
      );
    }
  }
}

///  push to new screen and remove all screens route before
 customPushAndRemoveUntil(context ,Widget page)async {

  if (kIsWeb) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        reverseTransitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
              opacity: animation,
              child:page,
            ),
      ),
          (Route<dynamic> route) => false,
    );
  }

  else{
    if(Platform.isAndroid){
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute<bool>(
          maintainState: false,
          builder: (BuildContext context) => page,
        ),(Route<dynamic> route) => false,
      );
    }

    if(Platform.isIOS){
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute<bool>(
          maintainState: false,
          builder: (BuildContext context) => page,
        ),(Route<dynamic> route) => false,
      );
    }

  }



}
