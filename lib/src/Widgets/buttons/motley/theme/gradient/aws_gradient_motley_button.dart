import 'package:flutter/material.dart';

class AwsGradientMotleyButton {
  final List<Color> colors;
  final List<double>? stops;
  final BlendMode backgroundBlendMode;

  AwsGradientMotleyButton(
      {required this.colors,
      this.stops,
      this.backgroundBlendMode = BlendMode.srcOver});
}
