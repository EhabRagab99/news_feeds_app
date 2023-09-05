import 'package:flutter/cupertino.dart';
import 'package:news_feeds_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/provider/loading_provider.dart';
import 'package:news_feeds_app/provider/localization_provider.dart';
import 'package:news_feeds_app/provider/public_providers.dart';
import 'package:news_feeds_app/service/api_handler/api_state.dart';
import 'package:provider/provider.dart';

class GeneratePublicProviders{

  static generatePublicProvidersOnLunch({required BuildContext context}){
    PublicProviders.appThemeProvider=Provider.of<AppThemeProvider>(context,listen: false,);
    PublicProviders.loadingProviderClass=Provider.of<LoadingProviderClass>(context,listen: false,);
    PublicProviders.localizationProvider=Provider.of<LocalizationProvider>(context,listen: false,);
    PublicProviders.connectivityInitProvider=Provider.of<ConnectivityInitProvider>(context,listen: false,);
    PublicProviders.generalApiState=Provider.of<GeneralApiState>(context,listen: false,);
  }
}
