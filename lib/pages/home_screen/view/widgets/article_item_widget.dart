import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/routes_handler/material_navigation.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/pages/article_details_screen/article_details_screen.dart';
import 'package:news_feeds_app/pages/home_screen/models/news_model.dart';
import 'package:news_feeds_app/utils/extensions/app_size_boxes.dart';
import 'package:news_feeds_app/widgets/custom_image_network.dart';
import 'package:news_feeds_app/widgets/custom_text_widget.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({
    super.key, required this.article, required this.heroTag,
  });

  final Article article;
  final int heroTag;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> customPushNavigator(context, ArticleDetailsScreen(article: article, heroTag: heroTag,)),
      child: Column(
        children: [
          Hero(
            tag: heroTag,
            child: CustomImageNetwork(
              image: article.urlToImage,
              fit: BoxFit.cover,
              loadingColor: ColorConfig().primaryColor(1),
              errorBackground: ColorConfig().grayBlackColor(.2),
              errorFit: BoxFit.contain,
              errorImageSize: SizeConfig.height * 0.04,
              errorPadding: EdgeInsets.only(bottom: SizeConfig.height * 0.00),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.all( SizeConfig.height * 0.015),
            decoration: BoxDecoration(
              color: ColorConfig().whiteColor(1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(article.title??"", fontSize: 21,),
                0.004.heightBox,
                CustomTextWidget("By  ${article.author??""}", fontSize: SizeConfig.height * 0.019, color: ColorConfig().greyColor(1),),
                0.016.heightBox,
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: CustomTextWidget(DateFormat('MMM dd, yyyy').format(article.publishedAt ?? DateTime.now()), fontSize: SizeConfig.height * 0.017,color: ColorConfig().greyColor(1),),
                ),
                0.016.widthBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
