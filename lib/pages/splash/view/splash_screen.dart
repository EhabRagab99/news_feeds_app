// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:news_feeds_app/helpers/shared_preference.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/main.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/check_connection_on_lunch.dart';
import 'package:news_feeds_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:news_feeds_app/provider/localization_provider.dart';
import 'package:provider/provider.dart';


class SplashScreenClass extends StatefulWidget {
  const SplashScreenClass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashClass();
  }
}

class SplashClass extends State<SplashScreenClass> {
  lunchApp({required BuildContext context})async{
    CheckConnectionOnLunch.checkHaveConnectionOnLunch(context: context);
    ColorConfig.appThemeColor=Provider.of<AppThemeProvider>(NewsFeedsApp.navigatorKey.currentState!.overlay!.context,listen: false,);
    await NewsFeedsApp.navigatorKey.currentState!.overlay!.context.read<LocalizationProvider>().fetchLocalization();
    await NewsFeedsApp.navigatorKey.currentState!.overlay!.context.read<AppThemeProvider>().getAppConfigResponse();
    await NewsFeedsApp.navigatorKey.currentState?.overlay?.context.read<AppThemeProvider>().statusBarTheme();
  }





  @override
  void initState() {
    super.initState();
    UserDataFromStorage.getData();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(mounted){
        Provider.of<SplashProvider>(context, listen: false).setIsSplashScreen(splash: true);
        Provider.of<SplashProvider>(context, listen: false).setConnectionCheckedBefore(checked: false);
         await Provider.of<ConnectivityInitProvider>(context, listen: false).initConnectivity(context: context);
        lunchApp(context: context);
      }
    });
  }


  @override
  void deactivate() async{
    await Provider.of<SplashProvider>(context, listen: false).disposeIsSplashScreen(splash: false);
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    final connectivityInitProvider=Provider.of<ConnectivityInitProvider>(context);

    return Scaffold(
      body: SizedBox(
        height:SizeConfig.height ,
        width: SizeConfig.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !connectivityInitProvider.hasConnection,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: SizeConfig.height*0.3,
                    height: SizeConfig.height*0.3,
                    child:Lottie.asset(
                      "assets/gif/no_internet2.json",
                      fit: BoxFit.contain,
                    ),
                  ),
                  //text No internet connection
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.height*0.02,left: SizeConfig.height * 0.004635,right: SizeConfig.height * 0.004635),
                    child: Text(
                      'You\'re currently offline',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorConfig().blackColor(1)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
