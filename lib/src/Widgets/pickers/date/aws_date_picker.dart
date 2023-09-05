import 'package:awesonestyle/src/Widgets/pickers/date/child/aws_child_date_picker.dart';
import 'package:awesonestyle/src/Widgets/pickers/date/child/setting/aws_setting_child_date_picker.dart';
import 'package:awesonestyle/src/Widgets/pickers/date/controller/aws_controller_date_picker.dart';
import 'package:flutter/material.dart';

import '../../../Services/services_link.dart';

class AwsDatePicker extends StatefulWidget {
  final AwsSettingChildDatePicker day;
  final AwsSettingChildDatePicker month;
  final AwsSettingChildDatePicker year;
  final void Function(AwsControllerDatePicker date)? onSelectedDateChanged;
  AwsDatePicker({
    Key? key,
    required this.day,
    required this.month,
    required this.year,
    this.onSelectedDateChanged,
  }) : super(key: key);

  @override
  State<AwsDatePicker> createState() => _AwsDatePickerState();
}

class _AwsDatePickerState extends State<AwsDatePicker> {
  String _dayL = '';

  String _monthL = '';

  String _yearL = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AwsChildDatePicker(
          length: widget.day.length,
          hint: _dayL.isEmpty ? null : widget.day.hint,
          theme: widget.day.theme,
          prefix: _dayL.isEmpty ? widget.day.prefix : _dayL,
          onSelectedItemChanged: (index) {
            setState(() {
              _dayL = (index + 1).toString();
              widget.onSelectedDateChanged
                  ?.call(AwsControllerDatePicker(_dayL, _monthL, _yearL));
            });
          },
        ),
        AwsChildDatePicker(
          length: widget.month.length,
          hint: _monthL.isEmpty ? null : widget.month.hint,
          theme: widget.month.theme,
          prefix: _monthL.isEmpty ? widget.month.prefix : _monthL,
          onSelectedItemChanged: (index) {
            setState(() {
              _monthL = (index + 1).toString();
              widget.onSelectedDateChanged
                  ?.call(AwsControllerDatePicker(_dayL, _monthL, _yearL));
            });
          },
        ),
        AwsChildDatePicker(
          year: widget.year.isYear,
          hint: _yearL.isEmpty ? null : widget.year.hint,
          theme: widget.year.theme,
          prefix: _yearL.isEmpty ? widget.year.prefix : _yearL,
          onSelectedItemChanged: (index) {
            setState(() {
              _yearL = (AwsGenerators.year()[index]).toString();
              widget.onSelectedDateChanged
                  ?.call(AwsControllerDatePicker(_dayL, _monthL, _yearL));
            });
          },
        ),
      ],
    );
  }
}
