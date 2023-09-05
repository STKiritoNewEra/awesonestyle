import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';

class AwsTextButtonShowing extends StatefulWidget {
  /// Sets the [text].
  final String text;

  /// Sets the style of the text [style].
  final TextStyle? style;

  /// Sets the fill color [filledColor].
  final Color? filledColor;

  /// Set the [onPressed].
  final VoidCallback? onPressed;

  /// Set up a dialog to confirm an action [confirmationDialog] and disable [onPressed].
  final CupertinoAlertDialog? confirmationDialog;

  /// Sets the animation of [AwsTextButtonShowing].
  final AwsAnimation? animation;

  /// Sets whether to expand the [AwsTextButtonShowing].
  final bool isExpanded;

  /// Set the [AwsTextButtonShowing].
  const AwsTextButtonShowing(
      {super.key,
      required this.text,
      this.style,
      this.onPressed,
      this.confirmationDialog,
      this.filledColor,
      this.isExpanded = false,
      this.animation});

  @override
  State<AwsTextButtonShowing> createState() => _AwsTextButtonShowingState();
}

class _AwsTextButtonShowingState extends State<AwsTextButtonShowing> {
  // Set the initial state
  @override
  void initState() {
    if (widget.confirmationDialog != null && widget.onPressed != null) {
      throw 'could not use [confirmationDialog] at the same time as [onPressed]';
    }
    super.initState();
  }

  // Return a different widget depending on [isExpanded].
  Widget _button() {
    return widget.isExpanded
        ? SizedBox(
            width: context.width(100),
            child: CupertinoButton(
              color: widget.filledColor,
              onPressed: widget.confirmationDialog != null
                  ? () => showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return widget.confirmationDialog!;
                        },
                      )
                  : widget.onPressed,
              child: Text(
                widget.text,
                style: widget.style,
              ),
            ),
          )
        : CupertinoButton(
            color: widget.filledColor,
            onPressed: widget.confirmationDialog != null
                ? () => showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return widget.confirmationDialog!;
                      },
                    )
                : widget.onPressed,
            child: Text(
              widget.text,
              style: widget.style,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    // Aplica una animación si esta se establecio [animation].
    return widget.animation == null
        ? _button()
        : AwsAniWidget(
            setting: AwsAniSetting(animation: widget.animation!),
            child: _button(),
          );
  }
}
