import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsIndicatorShowing extends StatefulWidget {
  /// Sets the width of the Indicator [width].
  final double? width;

  /// Sets the height of the indicator [height].
  final double? height;

  /// Sets the indicator color [color].
  final Color? color;

  /// Sets the gradient of the indicator [gradient].
  final Gradient? gradient;

  /// Sets the margin of the indicator [margin].
  final EdgeInsetsGeometry? margin;

  /// Sets the color of the border [borderColor].
  final Color? borderColor;

  /// Sets whether the border displays [border].
  final bool border;

  /// Sets the shadow if [shadow] is displayed.
  final bool shadow;

  /// Constructor of the indicator [AwsIndicatorShowing].
  const AwsIndicatorShowing({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.borderColor,
    this.border = true,
    this.shadow = true,
    this.color,
    this.gradient,
  });

  @override
  State<AwsIndicatorShowing> createState() => _AwsIndicatorShowingState();
}

class _AwsIndicatorShowingState extends State<AwsIndicatorShowing>
    with TickerProviderStateMixin {
  // Sets the initial state of the indicator.
  @override
  void initState() {
    if (widget.color != null && widget.gradient != null) {
      throw 'You cannot use [unselectedColor] and [unselectedGradient] at the same time';
    }

    super.initState();
  }

  // Default Height
  double _defaultHeight = 15;
  // Default Width
  double _defaultWidth = 15;

  // Default margin
  EdgeInsetsGeometry _defaultMargin = const EdgeInsets.all(4);
  // Default color
  Color _defaultColor = CupertinoColors.activeBlue;

  /// Default border color
  Color _defaultBorderColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? _defaultHeight,
      width: widget.width ?? _defaultWidth,
      margin: widget.margin ?? _defaultMargin,
      decoration: BoxDecoration(
        color: widget.color ?? _defaultColor,
        border: widget.border
            ? Border.all(color: widget.borderColor ?? _defaultBorderColor)
            : null,
        boxShadow: widget.shadow
            ? [
                BoxShadow(
                  color: widget.color?.withOpacity(.8) ??
                      _defaultColor.withOpacity(.8),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ]
            : null,
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
