import 'dart:ui';

import 'package:news_feeds_app/helpers/shared_preference.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/provider/public_providers.dart';

class ColorConfig {
  static final ColorConfig controller = ColorConfig._internal();
  factory ColorConfig() {
    return controller;
  }
  ColorConfig._internal();

  static AppThemeProvider appThemeColor = PublicProviders.appThemeProvider;

  //#region app bar Background  colors
  Color appbarBackgroundColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.appBar.appbarBackground
          : appThemeColor
          .appThemeColor.colors.lightMode.appBar.appbarBackground)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF13294B).withOpacity(opacity);
    }
  }

//#endregion

  //#region app Primary colors
  Color primaryColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode ? appThemeColor.appThemeColor.colors.darkMode.primaryAndScaffold.primaryColor : appThemeColor.appThemeColor.colors.lightMode.primaryAndScaffold.primaryColor).replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color secondaryColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.primaryAndScaffold.secondaryColor
          : appThemeColor.appThemeColor.colors.lightMode.primaryAndScaffold.secondaryColor)
          .replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

//#endregion

  //#region Scaffold Background colors
  Color scaffoldBackgroundColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.primaryAndScaffold.scaffoldBackgroundColor
          : appThemeColor.appThemeColor.colors.lightMode.primaryAndScaffold.scaffoldBackgroundColor).replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0x0fffffff).withOpacity(opacity);
    }
  }

//#endregion

  //#region appDivider colors
  Color dividerColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode ?
      appThemeColor.appThemeColor.colors.darkMode.divider.dividerColor : appThemeColor.appThemeColor.colors.lightMode.divider.dividerColor).replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

//#endregion

  Color whiteColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode ?
      appThemeColor.appThemeColor.colors.darkMode.theme.whiteColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.whiteColor).replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  //#region app Fonts colors
  Color blackColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.blackColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.blackColor).replaceAll("#", "0xFF"))).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color redColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.redColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.redColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color greyColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.greyColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.greyColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color borderColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.borderColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.borderColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF707070).withOpacity(opacity);
    }
  }

  Color grayBlackColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.grayBlackColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.grayBlackColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF707070).withOpacity(opacity);
    }
  }
  Color goldenColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.goldenColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.goldenColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFFFC107).withOpacity(opacity);
    }
  }
  Color greyLightColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.greyLightColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.greyLightColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFF1F1F1).withOpacity(opacity);
    }
  }
  Color greenLightColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.greenLightColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.greenLightColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFC0FFE6).withOpacity(opacity);
    }
  }
  Color greenColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.greenColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.greenColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF32AF04).withOpacity(opacity);
    }
  }
  Color redDarkColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.redDarkColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.redDarkColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFE23232).withOpacity(opacity);
    }
  }

  Color textFieldInputColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.textFieldInputColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.textFieldInputColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF312B29).withOpacity(opacity);
    }
  }

  Color validationTextColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.validationTextColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.validationTextColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFFF1D1D).withOpacity(opacity);
    }
  }

  Color yellowColor(double opacity) {
    try {
      return Color(int.parse((UserDataFromStorage.themeIsDarkMode
          ? appThemeColor.appThemeColor.colors.darkMode.theme.yellowColor
          : appThemeColor.appThemeColor.colors.lightMode.theme.yellowColor)
          .replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFFFC107).withOpacity(opacity);
    }
  }

//#endregion app Fonts colors


}
