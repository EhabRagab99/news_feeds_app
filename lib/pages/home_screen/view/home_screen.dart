import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/pages/home_screen/provider/api/api_get_home_articles.dart';
import 'package:news_feeds_app/pages/home_screen/provider/helper/home_helper.dart';
import 'package:news_feeds_app/pages/home_screen/view/widgets/article_item_widget.dart';
import 'package:news_feeds_app/pages/home_screen/view/widgets/my_drawer_widget.dart';
import 'package:news_feeds_app/provider/loading_provider.dart';
import 'package:news_feeds_app/service/api_handler/api_state.dart';
import 'package:news_feeds_app/utils/extensions/app_size_boxes.dart';
import 'package:news_feeds_app/utils/extensions/widget_extensions.dart';
import 'package:news_feeds_app/widgets/api_return_error_widget.dart';
import 'package:news_feeds_app/widgets/connection_error_widget.dart';
import 'package:news_feeds_app/widgets/loading_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        if(ApiGetNews().articles.isEmpty){
          await ApiGetNews().getNewsList(context: context);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    debugPrint(SizeConfig.height.toString());
    return SafeArea(
      child: Scaffold(
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
        drawer: const MyDrawerWidget(),
        body: Consumer4<GeneralApiState, HomeHelper, ApiGetNews, LoadingProviderClass>(
            builder: (context, generalApiState, homeHelperProvider,apiGetNews, loadingProviderClass, child) {
              return LoadingScreen(
                loading: apiGetNews.isWaiting,
                child: Builder(
                  builder: (context) {
                    if(apiGetNews.isWaiting){
                      return const Center();
                    }
                    if(apiGetNews.hasError){
                      return ErrorMsgWidget(errorMsg:apiGetNews.error.toString(),);
                    }
                    if(apiGetNews.connectionError){
                      return ConnectionErrorWidget(
                        tryAgainOnTap: ()async{
                          await ApiGetNews().getNewsList(context: context);
                        },
                      );
                    }
                    return ListView.separated(
                      padding: EdgeInsets.all(SizeConfig.height * 0.021),
                        shrinkWrap: true,
                        itemBuilder: (_,index)=>ArticleItemWidget(article: apiGetNews.articles[index],heroTag: index,), separatorBuilder: (_,__)=> 0.026.heightBox, itemCount: apiGetNews.articles.length);
                  }
                ),
              );
            }
        ),
      ),
    );
  }
}




