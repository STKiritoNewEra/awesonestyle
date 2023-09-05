import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';

class AwsTimeField extends StatefulWidget {
  const AwsTimeField({
    Key? key,
    required Future<String?> Function() dialogAwsTimePicker,
    String? Function(String?)? validator,
    InputDecoration? decoration,
    String? hint,
    String? label,
    required this.initial,
  })  : _dialogAwsTimePicker = dialogAwsTimePicker,
        _decoration = decoration,
        _validator = validator,
        _hint = hint,
        _label = label,
        super(key: key);
  final String? Function(String?)? _validator;
  final DateTime initial;
  final Future<String?> Function() _dialogAwsTimePicker;
  final InputDecoration? _decoration;
  final String? _hint;
  final String? _label;

  @override
  State<AwsTimeField> createState() => _AwsTimeFieldState();
}

class _AwsTimeFieldState extends State<AwsTimeField> {
  TextEditingController change = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: change.text.isEmpty
          ? TextEditingController(
              text: AwsFormatter.completTime(
                hour: widget.initial.hour,
                minute: widget.initial.minute,
              ),
            )
          : change,
      onTap: () async {
        String? result = await widget._dialogAwsTimePicker();
        if (result != null) {
          change.text = result;
        }
      },
      validator: widget._validator,
      decoration: widget._decoration ??
          AwsThemeTimeField.dateTimeInputDecoration(
            hint: widget._hint ?? 'Hora de inicio',
            label: widget._label ?? 'Hora de inicio',
            icon: Icons.timer,
          ),
    );
  }
}
