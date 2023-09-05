import 'package:flutter/material.dart';
import 'package:news_feeds_app/helpers/thems_and_decorations/app_color_config.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      this.text,{
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
      });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize ??14, color: color ??ColorConfig().blackColor(1), fontWeight: fontWeight),);
  }
}
