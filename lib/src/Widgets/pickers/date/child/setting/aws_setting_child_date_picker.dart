import 'package:awesonestyle/src/widgets/pickers/date/child/theme/aws_theme_child_date_picker.dart';

class AwsSettingChildDatePicker {
  final String prefix;
  final String? hint;
  final AwsThemeChildDatePicker? theme;
  final int? length;
  final bool isYear;
  AwsSettingChildDatePicker({
    required this.prefix,
    this.hint,
    this.theme,
    this.length,
    this.isYear = false,
  });
}
