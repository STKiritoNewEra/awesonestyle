import 'package:flutter/cupertino.dart';

class AwsFooterButtonBridge {
  final bool cupertino;
  final Widget title;
  final Widget? subtitle;
  final Widget leading;
  final Widget? trailing;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  AwsFooterButtonBridge({
    required this.title,
    this.subtitle,
    required this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.cupertino = true,
  });

  
}
