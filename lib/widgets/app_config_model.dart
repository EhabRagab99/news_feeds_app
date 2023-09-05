
class AppConfigModel {
  AppConfigModel({
    required this.colors,
  });

  final Colors colors;

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
    colors: Colors.fromJson(json["colors"]??{}),
  );
}

class Colors {
  Colors({
    required this.lightMode,
    required this.darkMode,
  });

  final Mode lightMode;
  final Mode darkMode;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    lightMode: Mode.fromJson(json["light_mode"]??{}),
    darkMode: Mode.fromJson(json["dark_mode"]??{}),
  );
}

class Mode {
  Mode({
    required this.appBar,
    required this.primaryAndScaffold,
    required this.divider,
    required this.theme,
  });

  final AppBar appBar;
  final PrimaryAndScaffold primaryAndScaffold;
  final Divider divider;
  final Theme theme;

  factory Mode.fromJson(Map<String, dynamic> json) => Mode(
    appBar: AppBar.fromJson(json["app_bar"]??{}),
    primaryAndScaffold: PrimaryAndScaffold.fromJson(json["primary_and_scaffold"]??{}),
    divider: Divider.fromJson(json["divider"]??{}),
    theme: Theme.fromJson(json["theme"]??{}),
  );
}

class AppBar {
  AppBar({
    required this.appbarBackground,
  });

  final String appbarBackground;

  factory AppBar.fromJson(Map<String, dynamic> json) => AppBar(
    appbarBackground: json["appbarBackground"]??"#13294B",
  );

}

class Divider {
  Divider({
    required this.dividerColor,
  });

  final String dividerColor;

  factory Divider.fromJson(Map<String, dynamic> json) => Divider(
    dividerColor: json["dividerColor"]??"#000000",
  );
}

class PrimaryAndScaffold {
  PrimaryAndScaffold({
    required this.primaryColor,
    required this.secondaryColor,
    required this.scaffoldBackgroundColor,
  });

  final String primaryColor;
  final String secondaryColor;
  final String scaffoldBackgroundColor;

  factory PrimaryAndScaffold.fromJson(Map<String, dynamic> json) => PrimaryAndScaffold(
    primaryColor: json["primaryColor"]??"#000000",
    secondaryColor: json["secondaryColor"]??"#000000",
    scaffoldBackgroundColor: json["scaffoldBackgroundColor"]??"#FFFFFF",
  );
}

class Theme {
  Theme( {
    required this.whiteColor,
    required this.orangeColor,
    required this.blackColor,
    required this.greyColor,
    required this.redColor,
    required this.borderColor,
    required this.grayBlackColor,
    required this.goldenColor,
    required this.greyLightColor,
    required this.greenLightColor,
    required this.greenColor,
    required this.redDarkColor,
    required this.textFieldInputColor,
    required this.validationTextColor,
    required this.yellowColor
  });

  final String whiteColor;
  final String grayBlackColor;
  final String orangeColor;
  final String blackColor;
  final String greyColor;
  final String redColor;
  final String borderColor;
  final String goldenColor;
  final String greyLightColor;
  final String greenColor;
  final String greenLightColor;
  final String redDarkColor;
  final String textFieldInputColor;
  final String validationTextColor;
  final String yellowColor;


  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
    whiteColor: json["whiteColor"]??"#ffffff",
    orangeColor: json["orangeColor"]??"#000000",
    grayBlackColor: json['grayBlackColor']??'#000000',
    blackColor: json["blackColor"]??"#000000",
    greyColor: json["greyColor"]??"#000000",
    redColor: json["redColor"]??"#000000",
    borderColor: json["borderColor"]??"#707070",
    goldenColor: json["goldenColor"]??"#FFC107",
    greyLightColor: json["greyLightColor"]??"#F1F1F1",
    greenLightColor: json["greenLightColor"]??"#C0FFE6",
    greenColor: json["greenColor"]??"#32AF04",
    redDarkColor: json["redDarkColor"]??"#E23232",
    textFieldInputColor: json["textFieldInputColor"]??"#312B29",
    validationTextColor: json["validationTextColor"]??"#FF1D1D",
    yellowColor: json["yellowColor"]??"#FFC107",
  );
}

