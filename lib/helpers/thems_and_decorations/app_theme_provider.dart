// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/shared_preference.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/api_get_app_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/card_decoration_theme.dart';
import 'package:news_feeds_app/widgets/app_config_model.dart';

class AppThemeProvider extends ChangeNotifier {
  bool _isWaiting = false;
  bool get isWaiting => _isWaiting;
  late bool themeIsDarkMode=UserDataFromStorage.themeIsDarkMode;
  SystemUiOverlayStyle statusBarStyle=const SystemUiOverlayStyle() ;

  late final ThemeMode _mode =UserDataFromStorage.themeIsDarkMode?ThemeMode.dark:ThemeMode.light;
  ThemeMode get theMode => _mode;

  late AppConfigModel appThemeColor ;

  TextTheme textTheme=TextTheme(
    headline1: TextStyle(fontSize: SizeConfig.headline1Size, fontWeight: FontWeight.normal,),//26px
    // titleMedium: TextStyle(fontSize: SizeConfig.headline1Size, fontWeight: FontWeight.normal,),//26px

    headline2: TextStyle(fontSize: SizeConfig.headline2Size, fontWeight: FontWeight.normal, ),//20px
    headline3: TextStyle(fontSize: SizeConfig.headline3Size, fontWeight: FontWeight.normal, ),//18px

    headline4: TextStyle(fontSize: SizeConfig.headline4Size, fontWeight: FontWeight.normal, ),//16px
    // headlineMedium:TextStyle(fontSize: SizeConfig.headline4Size, fontWeight: FontWeight.normal, ),//16px

    headline5: TextStyle(fontSize: SizeConfig.headline5Size, fontWeight: FontWeight.normal, ),//14px
    // headlineSmall: TextStyle(fontSize: SizeConfig.headline5Size, fontWeight: FontWeight.normal, ),//14px

    headline6: TextStyle(fontSize: SizeConfig.headline6Size, fontWeight: FontWeight.normal, ),//12px
    // titleLarge: TextStyle(fontSize: SizeConfig.headline6Size, fontWeight: FontWeight.normal, ),//12px

    subtitle1: TextStyle(fontSize: SizeConfig.subtitle1Size, fontWeight: FontWeight.normal, ),//10px

    subtitle2: TextStyle(fontSize: SizeConfig.subtitle3Size, fontWeight: FontWeight.normal, ),//10px

  );


  statusBarTheme() async {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    if(themeIsDarkMode){
      statusBarStyle=  SystemUiOverlayStyle(
        /// top status bar icon for ios color
        statusBarBrightness: Brightness.light,
        ///top status bar icon for android color
        statusBarIconBrightness: Brightness.dark,
        /// bottom bar button icon for android color
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: UserDataFromStorage.themeIsDarkMode?CardsDecorationThemeConfig.statusBarColorDark: CardsDecorationThemeConfig.statusBarColorLight ,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          /// top status bar icon for ios color
          statusBarBrightness: Brightness.light,
          ///top status bar icon for android color
          statusBarIconBrightness: Brightness.dark,
          /// bottom bar button icon for android color
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: UserDataFromStorage.themeIsDarkMode?CardsDecorationThemeConfig.statusBarColorDark: CardsDecorationThemeConfig.statusBarColorLight ,
        ),
      );
    }
    else{
      statusBarStyle=  SystemUiOverlayStyle(
        /// top status bar icon for ios color
        statusBarBrightness: Brightness.dark,
        ///top status bar icon for android color
        statusBarIconBrightness: Brightness.light,
        /// bottom bar button icon for android color
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: UserDataFromStorage.themeIsDarkMode?CardsDecorationThemeConfig.statusBarColorDark: CardsDecorationThemeConfig.statusBarColorLight ,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          /// top status bar icon for ios color
          statusBarBrightness: Brightness.dark,
          ///top status bar icon for android color
          statusBarIconBrightness: Brightness.light,
          /// bottom bar button icon for android color
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: UserDataFromStorage.themeIsDarkMode?CardsDecorationThemeConfig.statusBarColorDark: CardsDecorationThemeConfig.statusBarColorLight ,
        ),
      );
    }
    notifyListeners();
  }

  setThemeIsDarkMode({required bool darkMode}){
    // themeIsDarkMode=darkMode;
    // UserDataFromStorage.setThemeIsDarkMode(darkMode);
    // notifyListeners();
    //
    // if(themeIsDarkMode){
    //   _mode=ThemeMode.dark;
    // }
    // else{
    //   _mode=ThemeMode.light;
    // }
    // notifyListeners();
    statusBarTheme();

  }


  Future getAppConfigResponse() async {
    _isWaiting = true;
    notifyListeners();
    appThemeColor = await AppConfigResponse().getAppConfigResponse();
    _isWaiting = false;
    notifyListeners();
  }

  listen(){
    notifyListeners();
  }

}
