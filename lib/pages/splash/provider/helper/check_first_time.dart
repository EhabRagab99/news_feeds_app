import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_feeds_app/helpers/shared_preference.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/check_authorize.dart';
// import 'package:news_feeds_app/service/fcm_handler/badge_count_handle.dart';

class CheckFirstTimeApp{

  /// check if have new update or not
  static checkFirstTime()async{
    if(UserDataFromStorage.firstTime){
      CheckAuthorizeUser.checkAuthorize();
      FlutterNativeSplash.remove();
    }
    else{
      CheckAuthorizeUser.checkAuthorize();
    }
  }
}
