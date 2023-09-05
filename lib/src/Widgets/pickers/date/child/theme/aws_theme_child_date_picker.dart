import 'package:flutter/material.dart';

class AwsThemeChildDatePicker {
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? prefix;
  final TextStyle? hint;
  final AwsContentThemeChildDatePicker? content;
  final BoxBorder? border;

  AwsThemeChildDatePicker({
    this.backgroundColor,
    this.borderRadius,
    this.prefix,
    this.hint,
    this.content,
    this.border,
  });
}

class AwsContentThemeChildDatePicker {
  final TextStyle? style;
  final double? extent;
  final double? height;

  AwsContentThemeChildDatePicker({this.style, this.extent, this.height});
}
