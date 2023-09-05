import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_feeds_app/helpers/app_localizations.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:news_feeds_app/navigator_observer.dart';
import 'package:news_feeds_app/pages/splash/view/splash_screen.dart';
import 'package:news_feeds_app/provider/generate_public_providers.dart';
import 'package:news_feeds_app/provider/loading_provider.dart';
import 'package:news_feeds_app/provider/localization_provider.dart';
import 'package:news_feeds_app/provider/multi_providers.dart';
import 'package:news_feeds_app/provider/public_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  LocalizationProvider appLanguage = LocalizationProvider();
  await appLanguage.fetchLocalization();
  Future.delayed(const Duration(seconds: 2),(){
    runApp(MultiProvider(
      providers: providers,
      child:NewsFeedsApp(appLanguage: appLanguage,),
    ),);
  });


}

class NewsFeedsApp extends StatefulWidget {
  final LocalizationProvider appLanguage;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const NewsFeedsApp({Key? key,required this.appLanguage }) : super(key: key) ;

  @override
  State<NewsFeedsApp> createState() => _NewsFeedsAppState();

}


class _NewsFeedsAppState extends State<NewsFeedsApp> with WidgetsBindingObserver {

  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  initState(){
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(mounted){
        GeneratePublicProviders.generatePublicProvidersOnLunch(context: context);
      }
    });
    super.initState();

  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (kDebugMode) {
      print("APP_STATE: $state");
    }

    if (state == AppLifecycleState.resumed) {

      if (kDebugMode) {
        print('on reswrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      }
      
      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      if (kDebugMode) {
        print(' app is actevvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      }
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user quit our app temporally
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSetting = Provider.of<AppThemeProvider>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    PublicProviders.loadingProviderClass=Provider.of<LoadingProviderClass>(context,);

    return Consumer<AppThemeProvider>(
      builder: (context, AppThemeProvider themeNotifier, child) {
        return WillPopScope(
          onWillPop: ()async=> false,
          child: MaterialApp(
            navigatorKey: NewsFeedsApp.navigatorKey,
            title:"News feeds App" ,
            debugShowCheckedModeBanner: false,
            themeMode: appSetting.theMode,
            locale: localizationProvider.appLocal,
            supportedLocales: const [
              Locale('en', ''), // English, no country code
              Locale('ar', ''), // arabic, no country code
            ],
            navigatorObservers: [
              AppNavObserver()
            ],

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // FileViewLocalizationsDelegate.delegate,
            ],
            theme: ThemeData(
              primaryColor: ColorConfig().primaryColor(1),
              scaffoldBackgroundColor: ColorConfig().scaffoldBackgroundColor(1),
              brightness: Brightness.light,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent ,
              dividerColor: ColorConfig().dividerColor(1),
              cardColor: ColorConfig().scaffoldBackgroundColor(1),
              secondaryHeaderColor: ColorConfig().scaffoldBackgroundColor(1),
              appBarTheme: AppBarTheme(
                backgroundColor: ColorConfig().appbarBackgroundColor(1),
              ),
              textTheme:appSetting.textTheme,
              bottomAppBarTheme: BottomAppBarTheme(color: ColorConfig().scaffoldBackgroundColor(1)),
              colorScheme: ColorScheme.light(secondary:ColorConfig().primaryColor(1)).copyWith(
                primary: Colors.blue, background: ColorConfig().scaffoldBackgroundColor(1),
              ),
            ),
            darkTheme:ThemeData(
              primaryColor: ColorConfig().primaryColor(1),
              scaffoldBackgroundColor: ColorConfig().scaffoldBackgroundColor(1),
              brightness: Brightness.dark,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: ColorConfig().dividerColor(1) ,
              appBarTheme: AppBarTheme(
                backgroundColor: ColorConfig().appbarBackgroundColor(1),
              ),
              cardColor: ColorConfig().scaffoldBackgroundColor(1),
              secondaryHeaderColor: ColorConfig().scaffoldBackgroundColor(1),
              textTheme:appSetting.textTheme,
              bottomAppBarTheme: BottomAppBarTheme(color: ColorConfig().scaffoldBackgroundColor(1)),
              colorScheme: ColorScheme.dark(secondary:ColorConfig().primaryColor(1),).copyWith(primary: Colors.blue,
                background: ColorConfig().scaffoldBackgroundColor(1),
              ),
            ),
            home: const SplashScreenClass(),
          ),
        );
      },
    );
  }
}
