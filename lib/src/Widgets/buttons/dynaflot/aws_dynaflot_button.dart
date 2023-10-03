import 'package:awesonestyle/src/widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:awesonestyle/src/widgets/buttons/dynaflot/action/aws_action_dynaflot.dart';
import 'package:awesonestyle/src/widgets/buttons/dynaflot/icon/aws_icon_dynaflot.dart';
import 'package:awesonestyle/src/widgets/buttons/dynaflot/settings/animation/aws_animation_setting_dynaflot.dart';
import 'package:awesonestyle/src/widgets/buttons/dynaflot/settings/aws_setting_dynaflot.dart';
import 'package:awesonestyle/src/widgets/buttons/dynaflot/theme/aws_theme_dynaflot.dart';
import 'package:flutter/material.dart';

class AwsDynaflotButton extends StatefulWidget {
  ///Parent or body widget that is located below the floating button.
  final Widget child;

  ///List of children that will be displayed when the widget is clicked, you can use [AwsDuoButton] or whatever widget you want.
  final List<Widget> options;

  ///Icon that will be displayed when the button is open and closed.
  final AwsIconDynaflot icon;

  ///Customize the widget however you see fit.
  final AwsThemeDynaflot? theme;

  ///Customize the various widget animations as you see fit.
  final AwsAnimationSettingDynaflot animation;

  ///Configure the widget.
  final AwsSettingDynaflot setting;
  const AwsDynaflotButton({
    Key? key,
    required this.child,
    required this.icon,
    required this.options,
    this.theme,
    required this.animation,
    required this.setting,
  }) : super(key: key);

  @override
  State<AwsDynaflotButton> createState() => _AwsDynaflotButtonState();
}

class _AwsDynaflotButtonState extends State<AwsDynaflotButton> {
  GlobalKey key = GlobalKey();
  int count = 0;

  //positions
  double firstItemX = 0;
  double firstItemY = 0;
  double secondItemX = 0;
  double secondItemY = 0;
  double thirdItemX = 0;
  double thirdItemY = 0;
  double fourthItemX = 0;
  double fourthItemY = 0;
  double fifthItemX = 0;
  double fifthItemY = 0;

  //circular positions
  double topPositionY = 160;
  double topPositionX = 15;
  double bottomPositionY = 50;
  double bottomPositionX = 15;
  double centerRightX = 75;
  double centerRightY = 105;
  double bottomCenterY = 60;
  double bottomCenterX = 60;
  double topCenterY = 150;
  double topCenterX = 60;

  ///Default theme
  AwsThemeDynaflot defaultTheme = AwsThemeDynaflot();
  @override
  void initState() {
    if (widget.animation.delayAnimationOptions != null) {
      if (!(widget.animation.delayAnimationOptions!.length > 2) &&
          !(widget.animation.delayAnimationOptions!.length < 6)) {
        throw 'The animation delay should be equal to the number of [options]';
      }
    }
    if (widget.animation.animationOptions == null &&
        widget.animation.delayAnimationOptions != null) {
      throw 'If you want to set a delay to [options] animations you should set [animationOptions]';
    }

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      count = widget.options.length;
      bottomCenterY = count == 4 ? 75 : 60;
      bottomCenterX = count == 4 ? 65 : 60;
      topCenterY = count == 4 ? 135 : 150;
      topCenterX = count == 4 ? 65 : 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          key: key,
          bottom: widget.setting.spaceFromBottom,
          right: widget.setting.spaceFromRight,
          child: GestureDetector(
            onTap: () {
              if (widget.setting.spaceFromRight > 50 ||
                  widget.setting.spaceFromBottom > 500) {
                throw "maximum space from bottom is 500 and maximum space from right is 50";
              } else {
                if (widget.options.length > 1 && widget.options.length < 6) {
                  _fabDialog();
                } else {
                  throw "minimum 2 and maximum 5 items allowed";
                }
              }
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.theme != null
                    ? widget.theme!.openBackgroundColor
                    : defaultTheme.openBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: widget.theme != null
                        ? widget.theme!.openShadowColor
                        : defaultTheme.openShadowColor,
                    blurRadius: 5,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                widget.icon.open,
                color: widget.theme != null
                    ? widget.theme!.openColor
                    : defaultTheme.openColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _fabDialog() {
    // getPosition();
    getItemPositions();
    showDialog(
      barrierDismissible: widget.setting.barrierDismissible,
      useSafeArea: false,
      barrierColor: widget.theme?.barrierColor ?? Colors.black54,
      context: context,
      builder: (context) {
        return _showOptions();
      },
    );
  }

  getItemPositions() {
    if (widget.setting.type == AwsActionDynaflot.horizontal) {
      firstItemX = widget.setting.spaceFromRight + 60;
      firstItemY = widget.setting.spaceFromBottom + 5;
      secondItemX = widget.setting.spaceFromRight + 110;
      secondItemY = widget.setting.spaceFromBottom + 5;
      thirdItemX = widget.setting.spaceFromRight + 160;
      thirdItemY = widget.setting.spaceFromBottom + 5;
      fourthItemX = widget.setting.spaceFromRight + 210;
      fourthItemY = widget.setting.spaceFromBottom + 5;
      fifthItemX = widget.setting.spaceFromRight + 260;
      fifthItemY = widget.setting.spaceFromBottom + 5;
    } else if (widget.setting.type == AwsActionDynaflot.verticalUp) {
      firstItemX = widget.setting.spaceFromRight + 5;
      firstItemY = widget.setting.spaceFromBottom + 60;
      secondItemX = widget.setting.spaceFromRight + 5;
      secondItemY = widget.setting.spaceFromBottom + 110;
      thirdItemX = widget.setting.spaceFromRight + 5;
      thirdItemY = widget.setting.spaceFromBottom + 160;
      fourthItemX = widget.setting.spaceFromRight + 5;
      fourthItemY = widget.setting.spaceFromBottom + 210;
      fifthItemX = widget.setting.spaceFromRight + 5;
      fifthItemY = widget.setting.spaceFromBottom + 260;
    } else if (widget.setting.type == AwsActionDynaflot.verticalDown) {
      firstItemX = widget.setting.spaceFromRight + 5;
      firstItemY = widget.setting.spaceFromBottom - 60;
      secondItemX = widget.setting.spaceFromRight + 5;
      secondItemY = widget.setting.spaceFromBottom - 110;
      thirdItemX = widget.setting.spaceFromRight + 5;
      thirdItemY = widget.setting.spaceFromBottom - 160;
      fourthItemX = widget.setting.spaceFromRight + 5;
      fourthItemY = widget.setting.spaceFromBottom - 210;
      fifthItemX = widget.setting.spaceFromRight + 5;
      fifthItemY = widget.setting.spaceFromBottom - 260;
    } else {
      topPositionY = 90 + widget.setting.spaceFromBottom;
      bottomPositionY = widget.setting.spaceFromBottom - 80;
      centerRightY = widget.setting.spaceFromBottom + 5;
      bottomCenterY = count == 4
          ? widget.setting.spaceFromBottom - 25
          : widget.setting.spaceFromBottom - 40;
      topCenterY = count == 4
          ? 35 + widget.setting.spaceFromBottom
          : 50 + widget.setting.spaceFromBottom;
      topPositionX = 5 + widget.setting.spaceFromRight;
      bottomPositionX = 5 + widget.setting.spaceFromRight;
      centerRightX = 60 + widget.setting.spaceFromRight;
      bottomCenterX = count == 4
          ? 60 + widget.setting.spaceFromRight
          : 50 + widget.setting.spaceFromRight;
      topCenterX = count == 4
          ? 60 + widget.setting.spaceFromRight
          : 50 + widget.setting.spaceFromRight;
      firstItemX = topPositionX;
      firstItemY = topPositionY;
      secondItemX = count == 4 || count == 5
          ? topCenterX
          : count == 2
              ? bottomPositionX
              : centerRightX;
      secondItemY = count == 4 || count == 5
          ? topCenterY
          : count == 2
              ? bottomPositionY
              : centerRightY;
      thirdItemX = count == 4
          ? bottomCenterX
          : count == 5
              ? centerRightX
              : bottomPositionX;
      thirdItemY = count == 4
          ? bottomCenterY
          : count == 5
              ? centerRightY
              : bottomPositionY;
      fourthItemX = count == 5 ? bottomCenterX : bottomPositionX;
      fourthItemY = count == 5 ? bottomCenterY : bottomPositionY;
      fifthItemX = count == 5 ? bottomPositionX : bottomCenterX;
      fifthItemY = count == 5 ? bottomPositionY : bottomCenterY;
    }
  }

  _showOptions() {
    return Stack(
      children: [
        Positioned(
          bottom: widget.setting.spaceFromBottom,
          right: widget.setting.spaceFromRight,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.theme != null
                    ? widget.theme!.closedBackgroundColor
                    : defaultTheme.closedBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: widget.theme != null
                        ? widget.theme!.closedShadowColor
                        : defaultTheme.closedShadowColor.withOpacity(.8),
                    blurRadius: 5,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: Icon(
                  widget.icon.closed,
                  color: widget.theme != null
                      ? widget.theme!.closedColor
                      : defaultTheme.closedColor,
                ),
              ),
            ),
          ),
        ),
        if (widget.options.isNotEmpty)
          Positioned(
            right: firstItemX,
            bottom: firstItemY,
            child: Material(
              color: Colors.transparent,
              child: widget.animation.animationOptions == null
                  ? widget.options[0]
                  : AwsAniWidget(
                      setting: AwsAniSetting(
                        animation: widget.animation.animationOptions!,
                        delay: widget.animation.delayAnimationOptions != null
                            ? widget.animation.delayAnimationOptionsReverse
                                ? widget
                                    .animation.delayAnimationOptions!.reversed
                                    .toList()[0]
                                : widget.animation.delayAnimationOptions![0]
                            : null,
                      ),
                      child: widget.options[0],
                    ),
            ),
          ),
        if (widget.options.length > 1)
          Positioned(
            right: secondItemX,
            bottom: secondItemY,
            child: Material(
              color: Colors.transparent,
              child: widget.animation.animationOptions == null
                  ? widget.options[1]
                  : AwsAniWidget(
                      setting: AwsAniSetting(
                        animation: widget.animation.animationOptions!,
                        delay: widget.animation.delayAnimationOptions != null
                            ? widget.animation.delayAnimationOptionsReverse
                                ? widget
                                    .animation.delayAnimationOptions!.reversed
                                    .toList()[1]
                                : widget.animation.delayAnimationOptions![1]
                            : null,
                      ),
                      child: widget.options[1],
                    ),
            ),
          ),
        if (widget.options.length > 2)
          Positioned(
            bottom: thirdItemY,
            right: thirdItemX,
            child: Material(
              color: Colors.transparent,
              child: widget.animation.animationOptions == null
                  ? widget.options[2]
                  : AwsAniWidget(
                      setting: AwsAniSetting(
                        animation: widget.animation.animationOptions!,
                        delay: widget.animation.delayAnimationOptions != null
                            ? widget.animation.delayAnimationOptionsReverse
                                ? widget
                                    .animation.delayAnimationOptions!.reversed
                                    .toList()[2]
                                : widget.animation.delayAnimationOptions![2]
                            : null,
                      ),
                      child: widget.options[2],
                    ),
            ),
          ),
        if (widget.options.length > 3)
          Positioned(
            right: fourthItemX,
            bottom: fourthItemY,
            child: Material(
              color: Colors.transparent,
              child: widget.animation.animationOptions == null
                  ? widget.options[3]
                  : AwsAniWidget(
                      setting: AwsAniSetting(
                        animation: widget.animation.animationOptions!,
                        delay: widget.animation.delayAnimationOptions != null
                            ? widget.animation.delayAnimationOptionsReverse
                                ? widget
                                    .animation.delayAnimationOptions!.reversed
                                    .toList()[3]
                                : widget.animation.delayAnimationOptions![3]
                            : null,
                      ),
                      child: widget.options[3],
                    ),
            ),
          ),
        if (widget.options.length > 4)
          Positioned(
            right: fifthItemX,
            bottom: fifthItemY,
            child: Material(
              color: Colors.transparent,
              child: widget.animation.animationOptions == null
                  ? widget.options[4]
                  : AwsAniWidget(
                      setting: AwsAniSetting(
                        animation: widget.animation.animationOptions!,
                        delay: widget.animation.delayAnimationOptions != null
                            ? widget.animation.delayAnimationOptionsReverse
                                ? widget
                                    .animation.delayAnimationOptions!.reversed
                                    .toList()[4]
                                : widget.animation.delayAnimationOptions![4]
                            : null,
                      ),
                      child: widget.options[4],
                    ),
            ),
          ),
      ],
    );
  }
}
