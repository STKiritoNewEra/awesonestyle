import 'package:flutter/cupertino.dart';

class AwsThemeBridge {
  final AwsBarThemeBridge bar;
  final AwsItemThemeBridge item;
  final Color? footerDefaultColor;
  final bool painter;

  AwsThemeBridge({
    required this.bar,
    required this.item,
    this.footerDefaultColor,
    this.painter = false,
  });

  AwsThemeBridge copyWith(
          {AwsBarThemeBridge? bar,
          final AwsItemThemeBridge? item,
          bool? painter,
          Color? footerDefaultColor}) =>
      AwsThemeBridge(
          bar: bar ?? this.bar,
          item: item ?? this.item,
          painter: painter ?? this.painter,
          footerDefaultColor: footerDefaultColor ?? this.footerDefaultColor);

  static AwsThemeBridge base() {
    return AwsThemeBridge(
      bar: AwsBarThemeBridge(),
      item: AwsItemThemeBridge(
        isSelectedColor: CupertinoColors.activeBlue,
        notSelectedColor: CupertinoColors.inactiveGray,
        labelStyle: const TextStyle(),
      ),
      painter: false,
    );
  }
}

class AwsBarThemeBridge {
  final Color? color;
  final BoxBorder? border;
  final Gradient? borderGradient;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;

  AwsBarThemeBridge({
    this.color,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.gradient,
    this.backgroundBlendMode,
    this.borderGradient,
  });

  AwsBarThemeBridge copyWith(
          {Color? color,
          BoxBorder? border,
          BorderRadiusGeometry? borderRadius,
          List<BoxShadow>? boxShadow,
          Gradient? gradient,
          BlendMode? backgroundBlendMode,
          Gradient? borderGradient}) =>
      AwsBarThemeBridge(
          color: color ?? this.color,
          border: border ?? this.border,
          borderRadius: borderRadius ?? this.borderRadius,
          boxShadow: boxShadow ?? this.boxShadow,
          gradient: gradient ?? this.gradient,
          backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
          borderGradient: borderGradient ?? this.borderGradient);

  static Gradient borderGradientBase(
      {Color? primary, Color? secondary, TileMode? tileMode}) {
    return SweepGradient(
      stops: const [
        0,
        0.80,
      ],
      startAngle: 0.95,
      colors: [
        primary ?? CupertinoColors.activeBlue,
        secondary ?? CupertinoColors.destructiveRed,
      ],
      tileMode: tileMode ?? TileMode.repeated,
    );
  }
}

class AwsItemThemeBridge {
  final Color isSelectedColor;
  final Color notSelectedColor;
  final TextStyle labelStyle;

  AwsItemThemeBridge(
      {this.isSelectedColor = CupertinoColors.activeBlue,
      this.notSelectedColor = CupertinoColors.inactiveGray,
      this.labelStyle = const TextStyle()});
  AwsItemThemeBridge copyWith({
    Color? isSelectedColorIcon,
    Color? notSelectedColorIcon,
    TextStyle? labelStyle,
  }) =>
      AwsItemThemeBridge(
        isSelectedColor: isSelectedColorIcon ?? this.isSelectedColor,
        notSelectedColor: notSelectedColorIcon ?? this.notSelectedColor,
        labelStyle: labelStyle ?? this.labelStyle,
      );
}
