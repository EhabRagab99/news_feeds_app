import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/pages/home_screen/models/drawer_model.dart';
import 'package:news_feeds_app/pages/home_screen/provider/helper/home_helper.dart';
import 'package:news_feeds_app/pages/home_screen/view/widgets/drawer_dialog_widget.dart';
import 'package:provider/provider.dart';

class StateOnDrawerItemClick{
  HomeHelper homeHelper=HomeHelper();
  StateOnDrawerItemClick(BuildContext context){
    homeHelper=Provider.of<HomeHelper>(context,listen: false);
  }
  onDrawerItemClick({required BuildContext context, DrawerModel? drawer}) async {
    Navigator.of(NewsFeedsApp.navigatorKey.currentState!.context).pop();
    await showDialog(
      context: context,
      barrierColor: ColorConfig().greyColor(0.5),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: DrawerDialogWidget(drawer: drawer ?? DrawerModel(iconPath: "assets/icons/profile.png", title: "Profile")),
        );
      },
    );
    homeHelper.listen();
  }
}