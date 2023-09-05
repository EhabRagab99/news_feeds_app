import 'package:flutter/material.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/pages/home_screen/models/news_model.dart';
import 'package:news_feeds_app/service/api_handler/api_state.dart';
import 'package:news_feeds_app/service/api_handler/http_request_handler.dart';
import 'package:news_feeds_app/service/api_handler/urls.dart';
import 'package:news_feeds_app/widgets/custom_toast/toast_widget.dart';

class ApiGetNews extends GeneralApiState {

  static final ApiGetNews controller = ApiGetNews._internal();
  factory ApiGetNews() {
    return controller;
  }
  ApiGetNews._internal();

  List<Article> articles = [];
  Future<void> getNewsList({required BuildContext context}) async {
    final firstNewsFuture = getFirstListNews(context);
    final secondNewsFuture = getSecondListNews(context);

    final firstNewsList = await firstNewsFuture;
    final secondNewsList = await secondNewsFuture;
    debugPrint("articles before adding any item's length: ${articles.length}");
    articles.addAll(firstNewsList?.articles ?? []);
    debugPrint("articles after adding first response's length: ${articles.length}");


    articles.addAll(secondNewsList?.articles ?? []);
    debugPrint("articles after adding second response's length: ${articles.length}");
  }

  Future<NewsModel?> getFirstListNews(BuildContext context) async {
    NewsModel? firstNewsList;
    setWaiting();
    try {
      final value = await HttpHelper().callService(
        url: getNewsNextWeb,
        responseType: ResponseType.get,
        authorization: false,
      );
      debugPrint(baseUrl+getNewsNextWeb);
      if (value != null) {
        firstNewsList = NewsModel.fromJson(value);
        setHasData();
      } else {
        setHasError();
        setError("Error: Response is null");
      }
    } catch (error) {
      debugPrint("catchError --------------> $getNewsNextWeb    §   §\n error= $error");
      if (error.toString() == "internet") {
        ShowToastFunctions.showToast(
          context: NewsFeedsApp.navigatorKey.currentState!.context,
          msg: "No internet",
        );
        setConnectionError();
      } else {
        setHasError();
        setError(error);
      }
    }
    return firstNewsList;
  }

  Future<NewsModel?> getSecondListNews(BuildContext context) async {
    NewsModel? secondNewsList;
    setWaiting();
    try {
      final value = await HttpHelper().callService(
        url: getNewsAssociated,
        responseType: ResponseType.get,
        authorization: false,
      );
      debugPrint(baseUrl+getNewsAssociated);
      if (value != null) {
        secondNewsList = NewsModel.fromJson(value);
        setHasData();
      } else {
        setHasError();
        setError("Error: Response is null");
      }
    } catch (error) {
      debugPrint("catchError --------------> $getNewsNextWeb    §   §\n error= $error");
      if (error.toString() == "internet") {
        ShowToastFunctions.showToast(
          context: NewsFeedsApp.navigatorKey.currentState!.context,
          msg: "No internet",
        );
        setConnectionError();
      } else {
        setHasError();
        setError(error);
      }
    }
    return secondNewsList;
  }

}
