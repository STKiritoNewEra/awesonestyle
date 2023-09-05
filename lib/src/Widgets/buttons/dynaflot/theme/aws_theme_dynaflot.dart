import 'package:flutter/material.dart';

class AwsThemeDynaflot {
  final Color openColor;
  final Color closedColor;
  final Color openShadowColor;
  final Color closedShadowColor;
  final Color openBackgroundColor;
  final Color closedBackgroundColor;
  final Color barrierColor;

  AwsThemeDynaflot({
    this.openColor = const Color.fromRGBO(0, 122, 255, 1),
    this.closedColor = const Color.fromRGBO(255, 255, 255, 1),
    this.openBackgroundColor = const Color.fromRGBO(255, 255, 255, 1),
    this.closedBackgroundColor = const Color.fromARGB(255, 255, 59, 48),
    this.openShadowColor = const Color.fromRGBO(0, 122, 255, 1),
    this.closedShadowColor = const Color.fromARGB(255, 255, 59, 48),
    this.barrierColor = Colors.black54,
  });

  AwsThemeDynaflot copyWith({
    Color? openColor,
    Color? closedColor,
    Color? openShadowColor,
    Color? closedShadowColor,
    Color? openBackgroundColor,
    Color? closedBackgroundColor,
    Color? barrierColor,
  }) =>
      AwsThemeDynaflot(
          openColor: openColor ?? this.openColor,
          closedColor: closedColor ?? this.closedColor,
          openBackgroundColor: openBackgroundColor ?? this.openBackgroundColor,
          closedBackgroundColor:
              closedBackgroundColor ?? this.closedBackgroundColor,
          openShadowColor: openShadowColor ?? this.openShadowColor,
          closedShadowColor: closedShadowColor ?? this.closedShadowColor,
          barrierColor: barrierColor ?? this.barrierColor);
}
