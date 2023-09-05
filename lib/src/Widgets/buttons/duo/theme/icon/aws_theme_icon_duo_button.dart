import 'package:flutter/material.dart';

class AwsThemeIconDuo {
  final Color color;
  final Color backgroundColor;

  AwsThemeIconDuo(
      {this.color = const Color.fromRGBO(255, 255, 255, 1),
      this.backgroundColor = const Color.fromRGBO(0, 122, 255, 1)});

  AwsThemeIconDuo copyWith({
    Color? color,
    Color? backgroundColor,
  }) =>
      AwsThemeIconDuo(
          color: color ?? this.color,
          backgroundColor: backgroundColor ?? this.backgroundColor);
}
