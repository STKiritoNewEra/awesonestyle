import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class AwsFlolinkButton extends StatefulWidget {
  ///Text
  final String text;

  ///Action that is performed when the widget is clicked.
  final void Function()? onPressed;

  ///Text size.
  final double? fontSize;

  ///Color when the pointer is over the widget.
  final Color? isHover;

  ///Color when the pointer is not over the widget.
  final Color? notHover;

  ///You can set the style of the text, [fontSize] is included here so it won't work if you set it outside of style.
  final TextStyle? style;

  ///A linear decoration to draw near the text.
  final TextDecoration decoration;
  AwsFlolinkButton({
    Key? key,
    this.decoration = TextDecoration.underline,
    required this.text,
    this.onPressed,
    this.fontSize,
    this.isHover,
    this.notHover,
    this.style,
  }) : super(key: key);

  @override
  State<AwsFlolinkButton> createState() => _AwsFlolinkButtonState();
}

class _AwsFlolinkButtonState extends State<AwsFlolinkButton> {
  bool isHover = false;

  Widget _checkPlatform() {
    if (Platform.isAndroid) {
      return _touch();
    } else if (Platform.isIOS) {
      return _touch();
    } else if (Platform.isWindows) {
      return _mouse();
    } else if (Platform.isMacOS) {
      return _mouse();
    } else if (Platform.isLinux) {
      return _mouse();
    } else if (Platform.isFuchsia) {
      return _mouse();
    } else {
      return _mouse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _checkPlatform();
  }

  bool isHoverTouch = false;
  Widget _touch() {
    return InkWell(
      onTap: () {
        widget.onPressed?.call();
        setState(() {
          isHoverTouch = true;
        });

        Future.delayed(Duration(milliseconds: 1000), () {
          setState(() {
            isHoverTouch = false;
          });
        });
      },
      splashColor: widget.isHover ?? Colors.blue,
      onLongPress: () {
        setState(() {
          isHoverTouch = true;
        });

        Future.delayed(Duration(milliseconds: 1000), () {
          setState(() {
            isHoverTouch = false;
          });
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          widget.text,
          style: widget.style ??
              TextStyle(
                fontSize: widget.fontSize ?? 16,
                fontWeight: FontWeight.bold,
                decoration: widget.decoration,
                decorationColor: widget.isHover ?? Colors.white,
                decorationThickness: 2.0,
                color: isHoverTouch
                    ? widget.isHover ?? Colors.white
                    : widget.notHover ?? Colors.grey[700],
              ),
        ),
      ),
    );
  }

  GestureDetector _mouse() {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: widget.style ??
                TextStyle(
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: FontWeight.bold,
                  decoration: widget.decoration,
                  decorationColor: widget.isHover ?? Colors.white,
                  decorationThickness: 2.0,
                  color: isHoverTouch
                      ? widget.isHover ?? Colors.white
                      : widget.notHover ?? Colors.grey[700],
                ),
          ),
        ),
      ),
    );
  }
}
