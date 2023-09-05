import 'package:flutter/cupertino.dart';

class AwsEditFormatMD {
  final TextStyle? textStyle;
  final double? cursorWidth;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? autocorrect;
  final TextAlignVertical? textAlignVertical;
  final StrutStyle? strutStyle;

  final TextAlign? textAlign;
  final Color? cursorColor;
  final TextInputType? keyboardType;

  AwsEditFormatMD(
      {this.textStyle,
      this.keyboardType,
      this.cursorColor,
      this.cursorWidth,
      this.smartDashesType,
      this.smartQuotesType,
      this.autocorrect,
      this.textAlignVertical,
      this.strutStyle,
      this.textAlign});
  AwsEditFormatMD copyWith({
    TextStyle? textStyle,
    double? cursorWidth,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool? autocorrect,
    TextAlignVertical? textAlignVertical,
    StrutStyle? strutStyle,
    UndoHistoryController? undoController,
    TextAlign? textAlign,
    Color? cursorColor,
    TextInputType? keyboardType,
  }) {
    return AwsEditFormatMD(
      textStyle: textStyle ?? this.textStyle,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      smartDashesType: smartDashesType ?? this.smartDashesType,
      smartQuotesType: smartQuotesType ?? this.smartQuotesType,
      autocorrect: autocorrect ?? this.autocorrect,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      cursorColor: cursorColor ?? this.cursorColor,
      keyboardType: keyboardType ?? this.keyboardType,
    );
  }
}
