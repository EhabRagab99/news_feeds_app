import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/pages/home_screen/models/drawer_model.dart';
import 'package:news_feeds_app/pages/home_screen/view/widgets/my_drawer_widget.dart';
import 'package:news_feeds_app/utils/extensions/app_size_boxes.dart';
import 'package:news_feeds_app/utils/extensions/widget_extensions.dart';
import 'package:news_feeds_app/widgets/custom_text_widget.dart';

class DrawerDialogWidget extends StatelessWidget {


  const DrawerDialogWidget({
    Key? key, required this.drawer,
  }) : super(key: key);

  final DrawerModel drawer;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.height * 0.01,bottom:SizeConfig.height * 0.15,),
      child: Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: BorderRadius.circular(SizeConfig.height*0.04),
          color: ColorConfig().whiteColor(1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              0.032.heightBox,
              DrawerItemWidget(drawer: drawer,).paddingOnly(start: SizeConfig.height*0.04),
              0.021.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: ()=> Navigator.of(context).pop(),
                    child: CustomTextWidget('Ok', color: ColorConfig().blackColor(1),fontSize: SizeConfig.height * 0.019,fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: ()=> Navigator.of(context).pop(),
                    child: CustomTextWidget('cancel', color: ColorConfig().greyColor(1),fontSize: SizeConfig.height * 0.019,fontWeight: FontWeight.w600),
                  ),
                ],
              ).paddingOnly(end: SizeConfig.height * 0.023),
              0.01.heightBox
            ],
          ),
        ),
      ).paddingSymmetric(horizontal:SizeConfig.height * 0.054),
    );
  }
}


