import 'package:awesonestyle/src/widgets/animations/ani_widget/animation/aws_animation.dart';
import 'package:flutter/animation.dart';

class AwsAniSetting {
  final AwsAnimation animation;
  final Duration? duration;
  final Duration? delay;
  final dynamic Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool? animate;
  final double? from;
  final bool infinite;
  final double? spins;
  final double to;

  AwsAniSetting(
      {required this.animation,
      this.duration,
      this.delay,
      this.controller,
      this.manualTrigger = false,
      this.animate,
      this.from,
      this.infinite = false,
      this.spins,
      this.to = 100});

  AwsAniSetting copyWith({
    AwsAnimation? animation,
    final Duration? duration,
    final Duration? delay,
    final dynamic Function(AnimationController)? controller,
    final bool? manualTrigger,
    final bool? animate,
    final double? from,
    final bool? infinite,
    final double? spins,
    final double? to,
  }) {
    return AwsAniSetting(
      animation: animation ?? this.animation,
      duration: duration ?? this.duration,
      delay: delay ?? this.delay,
      controller: controller ?? this.controller,
      manualTrigger: manualTrigger ?? this.manualTrigger,
      animate: animate ?? this.animate,
      from: from ?? this.from,
      infinite: infinite ?? this.infinite,
      spins: spins ?? this.spins,
      to: to ?? this.to,
    );
  }
}
