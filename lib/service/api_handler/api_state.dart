
 import 'package:flutter/material.dart';
import 'package:news_feeds_app/provider/public_providers.dart';

class GeneralApiState extends ChangeNotifier{
  String error;
  bool hasData, hasError, isWaiting, connectionError;

  GeneralApiState
      ({
    this.error="",
    this.hasError=false,
    this.hasData = false,
    this.isWaiting = false,
    this.connectionError = false
  });

  @override
  String toString() {
    return "{error: $error, hasData: $hasData,hasError: $hasError, isWaiting: $isWaiting, connectionError: $connectionError,}";
  }

  setError(dynamic err) {
    error = err.toString();
  }

  setWaiting() {
    error='';
    isWaiting = true;
    hasData = false;
    hasError = false;
    connectionError = false;
    notifyListeners();
    PublicProviders.generalApiState.listen();
  }


 setHasData(){
   isWaiting = false;
   hasData = true;
   hasError = false;
   connectionError = false;
   notifyListeners();
   PublicProviders.generalApiState.listen();
 }

  setHasError() {
    isWaiting = false;
    hasData = false;
    hasError = true;
    connectionError = false;
    PublicProviders.generalApiState.listen();
  }


  setConnectionError() {
    isWaiting = false;
    hasData = false;
    hasError = false;
    connectionError = true;
    PublicProviders.generalApiState.listen();
  }

  setDismissWaiting() {
    isWaiting = false;
    hasData = false;
    hasError = false;
    connectionError = false;
    PublicProviders.generalApiState.listen();
  }


  listen(){
    notifyListeners();
  }

 }
