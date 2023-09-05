import 'package:flutter/material.dart';

class AwsShadowMotleyButton {
  final Color color;
  final double blurRadius;
  final BlurStyle blurStyle;

  AwsShadowMotleyButton(
      {required this.color,
      this.blurRadius = 10.0,
      this.blurStyle = BlurStyle.outer});
}
