import 'package:awesonestyle/src/Widgets/buttons/dynaflot/action/aws_action_dynaflot.dart';

class AwsSettingDynaflot {
  final double spaceFromRight;
  final double spaceFromBottom;
  final AwsActionDynaflot type;
  final bool barrierDismissible;

  AwsSettingDynaflot(
      {this.spaceFromRight = 10,
      this.spaceFromBottom = 100,
      this.type = AwsActionDynaflot.ola,
      this.barrierDismissible = true});
}
