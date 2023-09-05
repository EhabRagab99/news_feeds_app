import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/provider/public_providers.dart';
import 'package:news_feeds_app/widgets/custom_toast/toast_widget.dart';

class PublicConnectionUpdated {

  static publicWhenConnectionUpdated(){

    if(PublicProviders.connectivityInitProvider.hasConnection){
      // connection back
      ShowToastFunctions.showPublicConnectionToast(
        context: NewsFeedsApp.navigatorKey.currentState!.overlay!.context,
        connected: true,
        margin:SizeConfig.height*0.03,
        msg: 'Connecting has restored',
      );


    }
    else{
      // show connection is not found
      ShowToastFunctions.showPublicConnectionToast(
        context: NewsFeedsApp.navigatorKey.currentState!.overlay!.context,
        connected: false,
        margin:SizeConfig.height*0.03,
        msg: 'You\'re currently offline',
      );
    }
  }

}
