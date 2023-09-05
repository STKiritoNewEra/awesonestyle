import 'package:flutter/material.dart';

/// deshacer y reenviar
class AwsEditPerformMD {
  AwsEditPerformMD(
    this._textEditingController, {
    this.initContent = '',
  });

  /// Longitud máxima de almacenamiento
  final _maxLength = 50;

  /// content inicial
  final String initContent;

  final _undoList = <_AwsEditData>[];
  final _redoList = <_AwsEditData>[];

  final TextEditingController _textEditingController;

  void change(text) {
    if (_textEditingController.text != '') {
      if (_undoList.isNotEmpty) {
        if (_textEditingController.text == _undoList.last.text) return;
      }
      if (_undoList.length >= _maxLength) _undoList.removeAt(0);
      _undoList.add(_AwsEditData(_textEditingController.text,
          _textEditingController.selection.baseOffset));
      _redoList.clear();
    }
  }

  /// revocar
  void undo() {
//    print(_undoList);
    if (_undoList.isNotEmpty) {
      _redoList.add(_undoList.last);
      _undoList.removeLast();
      if (_undoList.isNotEmpty) {
        _textEditingController.value = TextEditingValue(
          text: _undoList.last.text,
          selection: TextSelection(
              extentOffset: _undoList.last.position,
              baseOffset: _undoList.last.position),
        );
      } else {
        _textEditingController.value = TextEditingValue(
          text: initContent,
          selection: TextSelection(
              extentOffset: initContent.length, baseOffset: initContent.length),
        );
      }
    }
  }

  /// recuperar
  void redo() {
//    print(_redoList);
    if (_redoList.isNotEmpty) {
      _textEditingController.value = TextEditingValue(
        text: _redoList.last.text,
        selection: TextSelection(
            extentOffset: _redoList.last.position,
            baseOffset: _redoList.last.position),
      );
      _undoList.add(_redoList.last);
      _redoList.removeLast();
    }
  }
}

class _AwsEditData {
  final String text;
  final int position;

  _AwsEditData(this.text, this.position);

  @override
  String toString() {
    return 'text:$text position:$position';
  }
}
