import 'dart:math';

import 'package:awesonestyle/src/Widgets/animations/ani_widget/link/aws_link_ani_widget.dart';

class AwsAnimationSettingDynaflot {
  final AwsAnimation? animationChild;
  final AwsAnimation? animationOptions;
  final List<Duration>? delayAnimationOptions;
  final bool delayAnimationOptionsReverse;

  AwsAnimationSettingDynaflot(
      {this.animationChild,
      this.animationOptions,
      this.delayAnimationOptions,
      this.delayAnimationOptionsReverse = false});

  static List<Duration> delayAnimationOptionsSequential() {
    return [
      const Duration(milliseconds: 100),
      const Duration(milliseconds: 200),
      const Duration(milliseconds: 300),
      const Duration(milliseconds: 400),
      const Duration(milliseconds: 500),
    ];
  }

  static List<Duration> delayAnimationOptionsRandom() {
    final random = Random();
    return [
      Duration(milliseconds: random.nextInt(501) + 100),
      Duration(milliseconds: random.nextInt(501) + 100),
      Duration(milliseconds: random.nextInt(501) + 100),
      Duration(milliseconds: random.nextInt(501) + 100),
      Duration(milliseconds: random.nextInt(501) + 100),
    ];
  }
}
