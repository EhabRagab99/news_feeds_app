import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/preview_helper/show_photo_review.dart';
import 'package:news_feeds_app/helpers/routes_handler/material_navigation.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/pages/home_screen/models/news_model.dart';
import 'package:news_feeds_app/utils/extensions/app_size_boxes.dart';
import 'package:news_feeds_app/utils/extensions/widget_extensions.dart';
import 'package:news_feeds_app/widgets/custom_image_network.dart';
import 'package:news_feeds_app/widgets/custom_text_widget.dart';
import 'package:news_feeds_app/widgets/web_view_widget.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({Key? key, required this.article, required this.heroTag}) : super(key: key);

  final Article article;
  final int heroTag;

  @override
  Widget build(BuildContext context) {
    debugPrint(SizeConfig.height.toString());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: OpenWebsiteButton(article: article,),
        backgroundColor: ColorConfig().greyLightColor(1),
        appBar: AppBar(
          title: Text("link development".toUpperCase(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          centerTitle: true,
          actions: [
            Icon(Icons.search, size: SizeConfig.height * 0.032,).paddingOnly(end: 16)
          ],
          backgroundColor: ColorConfig().blackColor(1),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: heroTag,
                    child: GestureDetector(
                      onTap: ()=> showMultiPhotoView(context: context, imageList: [article.urlToImage??"assets/icons/placeholder.png"], ),
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
                  ),
                  PositionedDirectional(
                    end: 20,
                    bottom: 20,
                    child: Container(
                        padding: EdgeInsets.all(SizeConfig.height * 0.006),
                        decoration: BoxDecoration(
                          color: ColorConfig().whiteColor(0.6),
                          borderRadius: BorderRadius.circular(SizeConfig.height * 0.004),
                        ),
                        child: CustomTextWidget(DateFormat('MMM dd, yyyy').format(article.publishedAt ?? DateTime.now()), fontSize: SizeConfig.height * 0.017,color: ColorConfig().blackColor(1),)),
                  ),
                ],
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
                    CustomTextWidget(article.description??"", fontSize: SizeConfig.height * 0.019, color: ColorConfig().greyColor(1),),

                  ],
                ),
              ),
            ],
          ).paddingAll(SizeConfig.height * 0.021),
        )
      ),
    );
  }
}


class OpenWebsiteButton extends StatelessWidget {
  const OpenWebsiteButton({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 0.1,
      child: GestureDetector(
        onTap: ()=>customPushNavigator(context, WebViewScreen(url: article.url??"",)),
        child: Container(
          width: SizeConfig.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.014),
          margin: EdgeInsets.all(SizeConfig.height * 0.021),
          decoration: BoxDecoration(
            color: ColorConfig().blackColor(1),
          ),
          child: CustomTextWidget("open website".toUpperCase(), color:ColorConfig().whiteColor(1), fontSize: SizeConfig.height * 0.018,),
        ),
      ),
    );
  }
}


