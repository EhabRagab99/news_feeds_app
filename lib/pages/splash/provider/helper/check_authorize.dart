import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_feeds_app/helpers/routes_handler/material_navigation.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/pages/home_screen/view/home_screen.dart';



class CheckAuthorizeUser{
  /// check if have token saved in local storage
  static checkAuthorize()async{
    customPushAndRemoveUntil(NewsFeedsApp.navigatorKey.currentState!.overlay!.context, const HomeScreen());
    FlutterNativeSplash.remove();

  }
}
