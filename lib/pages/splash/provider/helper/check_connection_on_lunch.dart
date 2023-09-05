// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:news_feeds_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/version_availability.dart';
import 'package:news_feeds_app/provider/localization_provider.dart';
import 'package:provider/provider.dart';

class CheckConnectionOnLunch{

  static checkHaveConnectionOnLunch({required BuildContext context})async{
    initializeDateFormatting();
    ColorConfig.appThemeColor=Provider.of<AppThemeProvider>(NewsFeedsApp.navigatorKey.currentState!.overlay!.context,listen: false,);
    /// If it has internet connection
    if(NewsFeedsApp.navigatorKey.currentState!.overlay!.context.read<ConnectivityInitProvider>().hasConnection) {
      await NewsFeedsApp.navigatorKey.currentState!.overlay!.context.read<LocalizationProvider>().fetchLocalization();
      await NewsFeedsApp.navigatorKey.currentState!.overlay!.context.read<AppThemeProvider>().getAppConfigResponse();
      await CheckVersionAvailability.checkAppVersionUpdate();
    }
    /// No internet connection
    else{
      await NewsFeedsApp.navigatorKey.currentState!.overlay!.context.read<SplashProvider>().setConnectionCheckedBefore(checked: true);
      FlutterNativeSplash.remove();
    }


  }

}
