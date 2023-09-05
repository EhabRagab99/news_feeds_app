import 'package:flutter/material.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/check_connection_on_lunch.dart';
import 'package:news_feeds_app/provider/public_providers.dart';

class SplashConnectionUpdated {

  static splashWhenConnectionUpdated({required BuildContext context})async{
    if(PublicProviders.splashProvider.connectionCheckedBefore){
      CheckConnectionOnLunch.checkHaveConnectionOnLunch(context: context);
    }

  }

}
