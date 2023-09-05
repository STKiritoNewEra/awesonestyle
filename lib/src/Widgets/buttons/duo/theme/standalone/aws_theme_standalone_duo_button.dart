import 'package:flutter/material.dart';

class AwsThemeStandaloneDuo {
  final Color iconColor;
  final TextStyle style;
  final Color backgroundColor;

  AwsThemeStandaloneDuo(
      {this.iconColor = const Color.fromRGBO(255, 255, 255, 1),
      this.style = const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
      this.backgroundColor = const Color.fromRGBO(0, 122, 255, 1)});
  AwsThemeStandaloneDuo copyWith({
    Color? iconColor,
    TextStyle? style,
    Color? backgroundColor,
  }) =>
      AwsThemeStandaloneDuo(
          iconColor: iconColor ?? this.iconColor,
          style: style ?? this.style,
          backgroundColor: backgroundColor ?? this.backgroundColor);
}
