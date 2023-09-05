import 'package:awesonestyle/src/Widgets/buttons/duo/theme/icon/aws_theme_icon_duo_button.dart';
import 'package:awesonestyle/src/Widgets/buttons/duo/theme/standalone/aws_theme_standalone_duo_button.dart';
import 'package:awesonestyle/src/Widgets/buttons/duo/theme/text/aws_theme_text_duo_button_dynaflot.dart';

class AwsThemeDuo {
  final AwsThemeIconDuo icon;
  final AwsThemeTextDuo text;
  final AwsThemeStandaloneDuo? standalone;

  AwsThemeDuo({
    required this.icon,
    required this.text,
    this.standalone,
  });
}
