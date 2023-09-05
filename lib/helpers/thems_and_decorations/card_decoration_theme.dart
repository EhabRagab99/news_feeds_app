import 'package:flutter/material.dart' ;
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';


class CardsDecorationThemeConfig{

  static Color statusBarColorLight=Colors.white.withOpacity(0);
  static Color statusBarColorDark=Colors.black.withOpacity(0);

  // main cards decoration
  static BoxDecoration mainCardsDecoration(){
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().greyColor(0.2),
          spreadRadius: 0.5,
          blurRadius: 4,
          offset: const Offset(1, 2), // changes position of shadow
        ),
      ],
    );

  }

  // main cards decoration
  static BoxDecoration userAvatarDecoration(double borderWidth){
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height*0.1),
      border: Border.all(
        color: ColorConfig().redColor(0.5),
        width: borderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().greyColor(0.05),
          spreadRadius: 0.5,
          blurRadius: 1,
          offset: const Offset(1, 2), // changes position of shadow
        ),
      ],
    );

  }




  // search bar card decoration
  static BoxDecoration searchBarCardDecoration(){
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height*0.015,),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().greyColor(0.05),
          offset: const Offset(0.3, 3),
          blurRadius: 2,
        ),
      ],
    );
  }


}
