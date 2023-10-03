import 'package:awesonestyle/src/widgets/fields/date/theme/aws_theme_date_field.dart';
import 'package:flutter/material.dart';

class AwsDateField extends StatelessWidget {
  const AwsDateField(
      {Key? key,
      required DateTime dateTime,
      InputDecoration? decoration,
      String? hint,
      final String? label,
      void Function()? onTap})
      : _dateTime = dateTime,
        _decoration = decoration,
        _hint = hint,
        _label = label,
        _onTap = onTap,
        super(key: key);
  final DateTime _dateTime;
  final InputDecoration? _decoration;
  final String? _hint;
  final String? _label;
  final void Function()? _onTap;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
    );
    return TextField(
      readOnly: true,
      controller: controller,
      onTap: _onTap,
      decoration: _decoration ??
          AwsThemeDateField.dateTimeInputDecoration(
            hint: _hint ?? 'Fecha',
            label: _label ?? 'Fecha',
            icon: Icons.timer,
          ),
    );
  }
}
