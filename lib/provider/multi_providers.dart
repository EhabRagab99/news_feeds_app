import 'package:news_feeds_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/pages/home_screen/provider/api/api_get_home_articles.dart';
import 'package:news_feeds_app/pages/home_screen/provider/helper/home_helper.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:news_feeds_app/provider/loading_provider.dart';
import 'package:news_feeds_app/provider/localization_provider.dart';
import 'package:news_feeds_app/service/api_handler/api_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [

  ChangeNotifierProvider.value(value: LoadingProviderClass()),
  ChangeNotifierProvider.value(value: LocalizationProvider()),
  ChangeNotifierProvider.value(value: AppThemeProvider()),
  ChangeNotifierProvider.value(value: ConnectivityInitProvider()),
  ChangeNotifierProvider.value(value: GeneralApiState()),
  ChangeNotifierProvider.value(value: SplashProvider()),
  ChangeNotifierProvider.value(value: HomeHelper()),
  ChangeNotifierProvider.value(value: ApiGetNews()),

];
