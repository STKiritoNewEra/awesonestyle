import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  const AwsIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(60),
        ),
        padding: padding,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
