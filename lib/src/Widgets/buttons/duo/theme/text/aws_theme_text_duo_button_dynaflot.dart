import 'package:flutter/material.dart';

class AwsThemeTextDuo {
  final TextStyle style;
  final Color backgroundColor;

  AwsThemeTextDuo({
    this.style = const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1),
  });

  AwsThemeTextDuo copyWith({TextStyle? style, Color? backgroundColor}) =>
      AwsThemeTextDuo(
        style: style ?? this.style,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );
}
