import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/widgets/custom_toast/custom_toast_widget.dart';

class ShowToastFunctions{

  ShowToastFunctions._();
  static showToast({required BuildContext context, required String msg,double? margin=0}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior:SnackBarBehavior.floating ,
        content: CustomToastWidget(
          message: msg,
        ),
        elevation: 0,
        backgroundColor: ColorConfig().primaryColor(0),
        padding: EdgeInsets.only(bottom: SizeConfig.height * 0.4),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25),),),
      ),

    );

  }

  static showPublicConnectionToast({required BuildContext context,required String msg,required bool connected,double? margin=0}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.height*0.015,
              ),
              Icon(
                connected?Icons.wifi:Icons.wifi_off_sharp,
                color:ColorConfig().primaryColor(1),
              ),
              SizedBox(
                width: SizeConfig.height*0.015,
              ),

              Expanded(
                child: Text(
                  msg,
                  textAlign:TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().primaryColor(1),fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        elevation: 3,
        backgroundColor:connected? ColorConfig().primaryColor(1):ColorConfig().primaryColor(1),
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.all(SizeConfig.height*0.01),
        margin: EdgeInsets.only(
          bottom:SizeConfig.height*0.04+(margin!),
          left:(connected?SizeConfig.height * 0.02:SizeConfig.height * 0.06),
          right:(connected?SizeConfig.height * 0.02:SizeConfig.height * 0.06),
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25),),),
      ),
    );
  }



}
