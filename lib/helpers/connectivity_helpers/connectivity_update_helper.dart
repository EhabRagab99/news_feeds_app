import 'package:flutter/cupertino.dart';
import 'package:news_feeds_app/helpers/connectivity_helpers/public_connection_updated.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/splash_connection_updated.dart';
import 'package:news_feeds_app/provider/public_providers.dart';



class ConnectionChangesProvider {

  static connectionUpdatedListener({required BuildContext context}) {
    PublicConnectionUpdated.publicWhenConnectionUpdated();
    // check if in splash screen or not
      if(PublicProviders.splashProvider.isSplashScreen){
        SplashConnectionUpdated.splashWhenConnectionUpdated(context: context);
      }
      // in other view
      else{
        PublicConnectionUpdated.publicWhenConnectionUpdated();
      }

    }

}
