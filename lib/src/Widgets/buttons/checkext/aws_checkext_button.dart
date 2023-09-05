import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsCheckextButton extends StatelessWidget {
  ///Check value
  final bool value;

  ///Returns a different state if the current state changes.
  final void Function(bool?)? onChanged;

  ///Text that accompanies the check and provides information.
  final Text text;

  ///Change the distribution order.
  final bool textCheck;

  ///Enables the mode that takes all the available size.
  final bool expanded;

  ///It is the separation between the check and the text.
  final double separated;

  ///It is a widget that serves to mark an option that is accompanied by a text and can be used in different ways.
  AwsCheckextButton({
    Key? key,
    required this.value,
    required this.text,
    this.onChanged,
    this.textCheck = false,
    this.expanded = false,
    this.separated = 5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: CupertinoButton(
        child: textCheck ? _textCheck() : _checkText(),
        onPressed: onChanged == null ? null : () => onChanged?.call(value),
      ),
    );
  }

  Row _checkText() {
    return Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment:
          expanded ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        _check(),
        if (!expanded) SizedBox(width: separated),
        text,
      ],
    );
  }

  Row _textCheck() {
    return Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment:
          expanded ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        text,
        if (!expanded) SizedBox(width: separated),
        _check(),
      ],
    );
  }

  ClipRRect _check() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        constraints: BoxConstraints(maxWidth: 19, maxHeight: 19),
        color: Colors.black.withOpacity(0.1),
        child: Checkbox(
          value: value,
          onChanged: onChanged == null ? null : onChanged,
          shape: CircleBorder(),
          side: BorderSide(color: Colors.black.withOpacity(0.1)),
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
