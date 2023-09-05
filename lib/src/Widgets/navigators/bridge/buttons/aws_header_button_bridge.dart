import 'package:flutter/cupertino.dart';

class AwsHeaderButtonBridge {
  final bool cupertino;
  final String title;
  final String? subtitle;
  final Widget leading;
  final Widget? trailing;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  AwsHeaderButtonBridge({
    required this.title,
    this.subtitle,
    required this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.cupertino = true,
    this.titleStyle,
    this.subtitleStyle,
  });
}
