import 'package:shared_preferences/shared_preferences.dart';


class UserDataFromStorage {

  static late bool firstTime;
  static late bool themeIsDarkMode;
  static String languageCodeFromStorage='en';
  static String languageNameFromStorage="langEnglish";
  static setFirstTimeApp(bool value) {
    firstTime=value;
    _setData();
  }

  static setThemeIsDarkMode(bool darkMode) {
    themeIsDarkMode = darkMode;
    _setData();
  }
  static  setAppLanguageCode(String value)  {
    languageCodeFromStorage=value;
    _setData();
  }
  static  setAppLanguageName(String value)  {
    languageNameFromStorage=value;
    _setData();
  }
  static void _setData()async {

    final prefs= await SharedPreferences.getInstance();
    prefs.setBool("firstTime",firstTime);
    prefs.setBool("themeIsDarkMode",themeIsDarkMode);
    prefs.setString("languageCodeFromStorage",languageCodeFromStorage);
    prefs.setString("languageNameFromStorage",languageNameFromStorage);
  }


  static getData() async {
    final prefs = await SharedPreferences.getInstance();
    firstTime = prefs.getBool("firstTime")?? true;
    themeIsDarkMode = prefs.getBool("themeIsDarkMode")?? false;
    languageCodeFromStorage = prefs.getString("languageCodeFromStorage")??'en';
    languageNameFromStorage = prefs.getString("languageNameFromStorage")??'langEnglish';

  }

//#endregion

}
