import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/pages/home_screen/models/drawer_model.dart';
import 'package:news_feeds_app/pages/home_screen/provider/helper/home_helper.dart';
import 'package:news_feeds_app/pages/home_screen/provider/helper/state_on_drawer_item_click.dart';
import 'package:news_feeds_app/utils/extensions/app_size_boxes.dart';
import 'package:news_feeds_app/utils/extensions/widget_extensions.dart';
import 'package:news_feeds_app/widgets/custom_text_widget.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: SizeConfig.height * 0.04, start: SizeConfig.height * 0.03, end: SizeConfig.height * 0.026),
        child: Column(
          children: [
            GestureDetector(
              onTap: ()=> StateOnDrawerItemClick(context).onDrawerItemClick(context:context),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/icons/profile.png",height: 60, width: 60),
                  ),
                  0.016.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget("Welcome", color: ColorConfig().greyColor(1),),
                      CustomTextWidget("Tony Roshdy", color: ColorConfig().blackColor(1),fontSize: 16),
                    ],
                  ),
                  const Spacer(),
                  Image.asset("assets/icons/arrow.png",height: 30, width: 30,),
                ],
              ),
            ),
            0.060.heightBox,
            ...HomeHelper().drawerItems.map((e) => DrawerItemWidget(drawer: e,).paddingOnly(bottom: 50)).toList()
          ],
        ),
      ),

    );
  }
}
class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    super.key, required this.drawer,
  });
  final DrawerModel drawer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> StateOnDrawerItemClick(context).onDrawerItemClick(context: context, drawer: drawer),
      child: Row(
        children: [
          Image.asset(drawer.iconPath, height: SizeConfig.height * 0.03,width: SizeConfig.height * 0.03,),
          0.01.widthBox,
          CustomTextWidget(drawer.title, color: ColorConfig().blackColor(1),fontSize: 16),
        ],
      ),
    );
  }
}

