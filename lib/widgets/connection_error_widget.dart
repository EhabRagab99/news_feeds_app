import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_feeds_app/helpers/app_size_config.dart';
import 'package:news_feeds_app/widgets/custom_text_widget.dart';

class ConnectionErrorWidget extends StatelessWidget {
  final VoidCallback? tryAgainOnTap;
  final double? marginTop;
  final bool? fontWhiteColor;
  final bool? withTryAgainButton;

  const ConnectionErrorWidget({Key? key, this.tryAgainOnTap,this.marginTop=0,this.fontWhiteColor=false,this.withTryAgainButton=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top:marginTop ??0,
          left: SizeConfig.height * 0.06,
          right: SizeConfig.height * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // gif
            SizedBox(
              width: SizeConfig.height*0.25,
              height: SizeConfig.height*0.25,
              child:Lottie.asset(
                "assets/gif/no_internet2.json",
                fit: BoxFit.contain,
              ),
            ),
            //title
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.height*0.02,
              ),
              child: Text(
               'Lost connection',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height:SizeConfig.height * 0.01,
            ),
            //Description
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.height*0.0,
              ),
              child: Text(
                'lost Connection Description',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,                ),
              ),
            ),
            //try again
            Visibility(
              visible: withTryAgainButton!,
              child: Container(
                width: SizeConfig.height * 0.2,
                height: SizeConfig.height*0.045,
                margin: EdgeInsets.only(top:SizeConfig.height*0.02 ),
                child: TextButton(onPressed: tryAgainOnTap,child: const CustomTextWidget("tryAgainButton"),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
