import 'package:flutter/material.dart';
import 'package:news_feeds_app/pages/home_screen/models/drawer_model.dart';

class HomeHelper extends ChangeNotifier {
  DrawerModel? _selectedDrawer;
  DrawerModel? get selectedDrawer => _selectedDrawer;
  set selectedDrawer(DrawerModel? selectedDrawer) {
    _selectedDrawer = selectedDrawer;
    notifyListeners();
  }

  List<DrawerModel> drawerItems =[
    DrawerModel(iconPath: "assets/icons/explore.png", title: "Explore"),
    DrawerModel(iconPath: "assets/icons/live.png", title: "Live Chat"),
    DrawerModel(iconPath: "assets/icons/gallery.png", title: "Gallery"),
    DrawerModel(iconPath: "assets/icons/wishlist.png", title: "Wish List"),
    DrawerModel(iconPath: "assets/icons/explore.png", title: "E-Magazine"),
  ];


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  resetData(){
    listen();
  }

  listen(){
    notifyListeners();
  }


  ScrollController? controller;

  scrollListener() {
    if (controller!.offset >= controller!.position.maxScrollExtent &&
        !controller!.position.outOfRange) {
        notifyListeners();

    }
    if (controller!.offset <= controller!.position.minScrollExtent &&
        !controller!.position.outOfRange) {
        notifyListeners();

    }
  }
}
