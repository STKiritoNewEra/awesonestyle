import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';

class AwsThemeShowing {
  /// Sets the background color [backgroundColor].
  final Color backgroundColor;

  /// Sets the theme of the indicators [indicator].
  final AwsThemeIndicatorShowing indicator;

  /// Sets the global theme of the content [content]
  final AwsThemeContentShowing? content;

  /// Sets the theme of the next button [nextButton].
  final AwsThemeNextButtonShowing nextButton;

  /// Sets the global theme [AwsThemeShowing].
  AwsThemeShowing(
      {required this.backgroundColor,
      required this.indicator,
      this.content,
      required this.nextButton});
}

class AwsThemeIndicatorShowing {
  /// Sets the width of the indicator [width].
  final double? width;

  /// Sets the height of the indicator [height].
  final double? height;

  /// Sets the initial color of the indicator [initStatecolor].
  final Color? initStatecolor;

  /// Sets the color when the flag is selected [changeStatecolor].
  final Color? changeStatecolor;

  /// Sets the initial gradient of the indicator [initStateGradient].
  final Gradient? initStateGradient;

  /// Sets the gradient when the flag is selected [changeStateGradient].
  final Gradient? changeStateGradient;

  /// Sets the indicator separator [margin].
  final EdgeInsetsGeometry? margin;

  /// Sets the color of the border when it is true [borderColor].
  final Color? borderColor;

  /// Set the border to true so that [border] is displayed.
  final bool border;

  /// Set shadow to true to show [shadow].
  final bool shadow;

  /// Sets the initial animation of the indicator [initStateAnimation].
  final AwsAnimation initStateAnimation;

  /// Set the animation when the indicator is selected [changeStateAnimation].
  final AwsAnimation changeStateAnimation;

  /// Sets the theme of the indicator [AwsThemeIndicatorShowing].
  AwsThemeIndicatorShowing({
    this.width,
    this.height,
    this.initStatecolor = CupertinoColors.activeBlue,
    this.changeStatecolor = CupertinoColors.destructiveRed,
    this.initStateGradient,
    this.changeStateGradient,
    this.margin,
    this.borderColor,
    this.border = true,
    this.shadow = true,
    this.initStateAnimation = AwsAnimation.zoomIn,
    this.changeStateAnimation = AwsAnimation.bounceInUp,
  });
}

class AwsThemeNextButtonShowing {
  /// Sets the color of the arrow [arrowColor].
  final Color arrowColor;

  /// Sets the background color [backgroundColor].
  final Color backgroundColor;

  /// Sets material 3 to true but you can set it to false if you don't plan to use [useMaterial3].
  final bool? useMaterial3;

  /// Sets the initial animation of the button [iniStateAnimation].
  final AwsAnimation iniStateAnimation;

  /// Sets the theme of the NextButton [AwsThemeNextButtonShowing].
  AwsThemeNextButtonShowing({
    this.arrowColor = CupertinoColors.black,
    this.backgroundColor = CupertinoColors.activeBlue,
    this.iniStateAnimation = AwsAnimation.bounceInRight,
    this.useMaterial3,
  });
}

class AwsThemeContentShowing {
  /// Sets a color to the image if you don't want the original colors [colorImage].
  final Color? colorImage;

  /// Sets the way the image is displayed, you can force it to fill the entire [fitImage] space.
  final BoxFit? fitImage;

  /// Sets the animation that the image will have at the beginning [animationImage].
  final AwsAnimation? animationImage;

  /// Sets the animation that the title will have at the beginning [animationTitle].
  final AwsAnimation? animationTitle;

  /// Sets the animation that the body will have at the start [animationBody].
  final AwsAnimation? animationBody;

  /// Sets the duration of the animations of the content [duration].
  final Duration? duration;

  /// Sets the delay for the start of animations [delay].
  final Duration? delay;

  /// Sets the title style [titleStyle].
  final TextStyle? titleStyle;

  /// Sets the style of the body [bodyStyle].
  final TextStyle? bodyStyle;

  /// Sets the position of the title [titleAlign].
  final TextAlign? titleAlign;

  /// Sets the position of the body [bodyAlign].
  final TextAlign? bodyAlign;

  /// Sets the theme of the content [AwsThemeContentShowing].
  AwsThemeContentShowing({
    this.colorImage,
    this.fitImage,
    this.animationImage,
    this.animationTitle,
    this.animationBody,
    this.duration,
    this.delay,
    this.titleStyle,
    this.bodyStyle,
    this.titleAlign,
    this.bodyAlign,
  });
}
