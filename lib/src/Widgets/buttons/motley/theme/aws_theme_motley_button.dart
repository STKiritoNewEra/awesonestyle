import 'package:awesonestyle/src/widgets/buttons/motley/theme/gradient/aws_gradient_motley_button.dart';
import 'package:awesonestyle/src/widgets/buttons/motley/theme/shadow/aws_shadow_motley_button.dart';

class AwsThemeMotleyButton {
  final AwsGradientMotleyButton? gradient;
  final AwsShadowMotleyButton? shadow;
  final bool boxShadow;
  AwsThemeMotleyButton({this.gradient, this.shadow, this.boxShadow = false});
}
