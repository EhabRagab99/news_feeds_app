import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/preview_helper/show_photo_review.dart';
import 'package:news_feeds_app/helpers/routes_handler/material_navigation.dart';

extension OnTapFadeImageExtension on FadeInImage {
  Widget showOnTap(BuildContext context){
    return InkWell(
      onTap: (){
        customPushNavigator(context, MultiImageViewWidget(
          imageList: const [],
          image: image,
        ));
      },
      child: this,
    );
  }
}
