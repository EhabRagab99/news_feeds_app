import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/shared_preference.dart';

class LocalizationProvider extends ChangeNotifier {
  late String appLanguageCode=UserDataFromStorage.languageCodeFromStorage;
  Locale _appLocale = const Locale('en');
  String appLanguageName=UserDataFromStorage.languageNameFromStorage;
  Locale get appLocal => _appLocale;

  setAppLanguageName(String language){
    appLanguageName= language;
    UserDataFromStorage.setAppLanguageName(language);
    notifyListeners();
  }


  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }


  lessen(){
    notifyListeners();
  }

  fetchLocalization() async {
    UserDataFromStorage.getData();
    if (UserDataFromStorage.languageCodeFromStorage.isEmpty) {
      _appLocale = const Locale("en");
      UserDataFromStorage.setAppLanguageCode('en');
      UserDataFromStorage.setAppLanguageName('langArabic');
      setAppLanguageName('langArabic');
      changeLanguage('en');
      if (kDebugMode) {
        print('lang ........................... ${UserDataFromStorage.languageCodeFromStorage}');
      }

      return null;
    }else {
      _appLocale = Locale(UserDataFromStorage.languageCodeFromStorage);
    }
    if (kDebugMode) {
      print('i have old lang ===${_appLocale.toString()}');
    }
    return null;
  }

  changeLanguage(String type) async {
    switch(type){
      case 'ar':{
        _appLocale = const Locale("ar");
        UserDataFromStorage.setAppLanguageCode('ar');
        if (kDebugMode) {
          print('language after ........................ change to arabic ${_appLocale.toString()}');
        }
        notifyListeners();
      }
      break;
      case 'en':{
        _appLocale = const Locale("en");
        UserDataFromStorage.setAppLanguageCode('en');
        if (kDebugMode) {
          print('language after ........................ change to English ${_appLocale.toString()}');
        }
        notifyListeners();
      }
      break;
    }

    notifyListeners();
  }


}
