import 'package:awesonestyle/src/widgets/animations/ani_widget/animation/aws_animation.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_fades.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_fadeouts.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_bounces.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_attention_seekers.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_elastics.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_flips.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_slides.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_specials.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/animations/aws_zooms.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/setting/aws_ani_setting.dart';
import 'package:flutter/material.dart';

class AwsAniWidget extends StatefulWidget {
  /// Sets the widget to animate [child].
  final Widget child;

  /// Sets the animation settings [setting].
  final AwsAniSetting setting;

  /// [AwsAniWidget] is a widget that unifies different animations from a single widget,
  /// Instead of using different widgets giving the need to change widgets and their settings and wasting time.
  AwsAniWidget({
    Key? key,
    required this.child,
    required this.setting,
  }) : super(key: key);

  @override
  _AwsAniWidgetState createState() => _AwsAniWidgetState();
}

class _AwsAniWidgetState extends State<AwsAniWidget> {
  Widget _animationChild() {
    if (widget.setting.animation == AwsAnimation.fadeIn) {
      return AwsFadeIn(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInDown) {
      return AwsFadeInDown(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 200),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInDownBig) {
      return AwsFadeInDownBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInUp) {
      return AwsFadeInUp(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInUpBig) {
      return AwsFadeInUpBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInLeft) {
      return AwsFadeInLeft(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInLeftBig) {
      return AwsFadeInLeftBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInRight) {
      return AwsFadeInRight(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeInRightBig) {
      return AwsFadeInRightBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1200),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.fadeOut) {
      return AwsFadeOut(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutDown) {
      return AwsFadeOutDown(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutDownBig) {
      return AwsFadeOutDownBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutUp) {
      return AwsFadeOutUp(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutUpBig) {
      return AwsFadeOutUpBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutLeft) {
      return AwsFadeOutLeft(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutLeftBig) {
      return AwsFadeOutLeftBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1300),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutRight) {
      return AwsFadeOutRight(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.fadeOutRightBig) {
      return AwsFadeOutRightBig(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1200),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? false,
        from: widget.setting.from ?? 600,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.bounceInDown) {
      return AwsBounceInDown(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 700),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 75,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.bounceInUp) {
      return AwsBounceInUp(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 75,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.bounceInLeft) {
      return AwsBounceInLeft(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 75,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.bounceInRight) {
      return AwsBounceInRight(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 75,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.elasticIn) {
      return AwsElasticIn(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.elasticInDown) {
      return AwsElasticInDown(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 200,
        to: widget.setting.to,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.elasticInUp) {
      return AwsElasticInUp(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 200,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.elasticInLeft) {
      return AwsElasticInLeft(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 200,
        to: widget.setting.to,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.elasticInRight) {
      return AwsElasticInRight(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 200,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.slideInDown) {
      return AwsSlideInDown(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.slideInUp) {
      return AwsSlideInUp(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.slideInLeft) {
      return AwsSlideInLeft(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.slideInRight) {
      return AwsSlideInRight(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 600),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 100,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.flipInX) {
      return AwsFlipInX(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.flipInY) {
      return AwsFlipInY(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 400),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.zoomIn) {
      return AwsZoomIn(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 500),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 1.0,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.zoomOut) {
      return AwsZoomOut(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 500),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 0.0,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.jelloIn) {
      return AwsJelloIn(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    //
    if (widget.setting.animation == AwsAnimation.bounce) {
      return AwsBounce(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 900),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        from: widget.setting.from ?? 50,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.flash) {
      return AwsFlash(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.pulse) {
      return AwsPulse(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.swing) {
      return AwsSwing(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 800),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.spin) {
      return AwsSpin(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        spins: widget.setting.spins ?? 1,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.spinPerfect) {
      return AwsSpinPerfect(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        spins: widget.setting.spins ?? 1,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.dance) {
      return AwsDance(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 1000),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    if (widget.setting.animation == AwsAnimation.roulette) {
      return AwsRoulette(
        key: widget.key,
        duration: widget.setting.duration ?? const Duration(milliseconds: 3500),
        delay: widget.setting.delay ?? const Duration(milliseconds: 0),
        controller: widget.setting.controller,
        infinite: widget.setting.infinite,
        spins: widget.setting.spins ?? 2,
        manualTrigger: widget.setting.manualTrigger,
        animate: widget.setting.animate ?? true,
        child: widget.child,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _animationChild();
  }
}
