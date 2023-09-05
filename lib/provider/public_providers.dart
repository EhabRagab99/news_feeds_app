import 'package:news_feeds_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:news_feeds_app/provider/loading_provider.dart';
import 'package:news_feeds_app/provider/localization_provider.dart';
import 'package:news_feeds_app/service/api_handler/api_state.dart';

class PublicProviders {
  static AppThemeProvider appThemeProvider=AppThemeProvider();
  static LoadingProviderClass loadingProviderClass=LoadingProviderClass();
  static LocalizationProvider localizationProvider=LocalizationProvider();
  // static HelperBottomBar helperBottomBar=HelperBottomBar();
  static ConnectivityInitProvider connectivityInitProvider=ConnectivityInitProvider();
  static GeneralApiState generalApiState=GeneralApiState();
  static SplashProvider splashProvider = SplashProvider();

}
