import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';

class CustomToastWidget extends StatelessWidget {
  final String message;
  final bool withToPadding;

  const CustomToastWidget({
    Key? key,
    required this.message,
    this.withToPadding=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25),),
        color: Colors.redAccent,
      ),
      margin: EdgeInsets.only(bottom:withToPadding?0: SizeConfig.height*0.02,left:SizeConfig.height*0.0,right: SizeConfig.height*0.0 ),
      padding: EdgeInsets.all(SizeConfig.height*0.02),
      child: Text(
       message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: SizeConfig.headline4Size),
      ),
    );
  }

}
