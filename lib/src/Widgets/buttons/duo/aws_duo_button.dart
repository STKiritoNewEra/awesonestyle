import 'package:awesonestyle/src/widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:awesonestyle/src/widgets/buttons/duo/theme/aws_theme_duo_button.dart';
import 'package:awesonestyle/src/widgets/buttons/duo/theme/icon/aws_theme_icon_duo_button.dart';
import 'package:awesonestyle/src/widgets/buttons/duo/theme/standalone/aws_theme_standalone_duo_button.dart';
import 'package:awesonestyle/src/widgets/buttons/duo/theme/text/aws_theme_text_duo_button_dynaflot.dart';
import 'package:flutter/cupertino.dart';

class AwsDuoButton extends StatefulWidget {
  ///Icon
  final IconData icon;

  ///Text
  final String text;

  ///You can customize AwsduoButton
  final AwsThemeDuo? theme;

  ///You can enable this option if you want the icon and text to display together.
  final bool standalone;

  ///Describes a separation of the widget from its parent.
  final EdgeInsetsGeometry? padding;

  ///Add separate animations for the icon and the text.
  final List<AwsAniSetting>? animations;

  ///Add an animation for the entire widget.
  final AwsAniSetting? animation;

  ///Add an animation for when the widget is held down.
  final AwsAnimation? animationOnLongPress;

  ///Action to perform when the widget is clicked.
  final VoidCallback? onPressed;

  const AwsDuoButton({
    super.key,
    required this.icon,
    required this.text,
    this.padding,
    this.onPressed,
    this.standalone = false,
    this.theme,
    this.animations,
    this.animation,
    this.animationOnLongPress,
  });

  @override
  State<AwsDuoButton> createState() => _AwsDuoButtonState();
}

class _AwsDuoButtonState extends State<AwsDuoButton> {
  //Default theme
  final AwsThemeDuo defaultTheme = AwsThemeDuo(
    icon: AwsThemeIconDuo(),
    text: AwsThemeTextDuo(),
    standalone: AwsThemeStandaloneDuo(),
  );

  //Default padding
  final EdgeInsetsGeometry defaultPadding = EdgeInsets.all(5);

  @override
  void initState() {
    if (widget.animations?.length != null) {
      if (widget.animations!.isEmpty || widget.animations!.length > 3) {
        throw 'Animations list is empty or out of range';
      }
    }
    if (widget.animations != null && widget.standalone) {
      throw 'You cannot use animations when standalone is true';
    }
    super.initState();
  }

  // Icon and text are separated.
  Widget _notStandalone(BuildContext context) {
    if (widget.animations == null) {
      return GestureDetector(
        onTap: widget.onPressed,
        child: AwsAniWidget(
          setting: AwsAniSetting(
            animation: widget.animationOnLongPress ?? AwsAnimation.dance,
            controller: (c) => controllerOnLongPress = c,
            manualTrigger: true,
            animate: widget.animationOnLongPress == null ? false : true,
          ),
          child: GestureDetector(
            onLongPress: widget.animationOnLongPress == null
                ? null
                : () {
                    controllerOnLongPress?.reset();
                    controllerOnLongPress?.forward();
                  },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _text(),
                const SizedBox(width: 5),
                _icon(),
              ],
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: widget.onPressed,
      child: AwsAniWidget(
        setting: AwsAniSetting(
          animation: widget.animationOnLongPress ?? AwsAnimation.dance,
          controller: (c) => controllerOnLongPress = c,
          manualTrigger: true,
          animate: widget.animationOnLongPress == null ? false : true,
        ),
        child: GestureDetector(
          onLongPress: widget.animationOnLongPress == null
              ? null
              : () {
                  controllerOnLongPress?.reset();
                  controllerOnLongPress?.forward();
                },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AwsAniWidget(
                setting: widget.animations![1],
                child: _text(),
              ),
              const SizedBox(width: 5),
              AwsAniWidget(
                setting: widget.animations![0],
                child: _icon(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _icon() {
    return Container(
      decoration: BoxDecoration(
        color: widget.theme != null
            ? widget.theme!.icon.backgroundColor
            : defaultTheme.icon.backgroundColor,
        borderRadius: BorderRadius.circular(60),
      ),
      padding: widget.padding ?? defaultPadding,
      child: Icon(
        widget.icon,
        color: widget.theme != null
            ? widget.theme!.icon.color
            : defaultTheme.icon.color,
      ),
    );
  }

  Container _text() {
    return Container(
      decoration: BoxDecoration(
        color: widget.theme != null
            ? widget.theme!.text.backgroundColor
            : defaultTheme.text.backgroundColor,
        borderRadius: BorderRadius.circular(60),
      ),
      padding: widget.padding ?? defaultPadding,
      child: Text(
        widget.text,
        style: widget.theme != null
            ? widget.theme!.text.style
            : defaultTheme.text.style,
      ),
    );
  }

  // Long press animation controller
  AnimationController? controllerOnLongPress;

  // Icon and text are one.
  Widget _standalone() {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AwsAniWidget(
        setting: AwsAniSetting(
          animation: widget.animationOnLongPress ?? AwsAnimation.dance,
          controller: (c) => controllerOnLongPress = c,
          manualTrigger: true,
          animate: widget.animationOnLongPress == null ? false : true,
        ),
        child: GestureDetector(
          onLongPress: widget.animationOnLongPress == null
              ? null
              : () {
                  controllerOnLongPress?.reset();
                  controllerOnLongPress?.forward();
                },
          child: Container(
            decoration: BoxDecoration(
              color: widget.theme?.standalone != null
                  ? widget.theme!.standalone!.backgroundColor
                  : defaultTheme.standalone!.backgroundColor,
              borderRadius: BorderRadius.circular(60),
            ),
            padding: widget.padding ?? defaultPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text,
                  style: widget.theme?.standalone != null
                      ? widget.theme!.standalone!.style
                      : defaultTheme.standalone!.style,
                ),
                const SizedBox(width: 5),
                Icon(
                  widget.icon,
                  color: widget.theme?.standalone != null
                      ? widget.theme!.standalone!.iconColor
                      : defaultTheme.standalone!.iconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.standalone
        ? widget.animation?.animation != null
            ? AwsAniWidget(
                setting: widget.animation!,
                child: _standalone(),
              )
            : _standalone()
        : widget.animation?.animation != null
            ? AwsAniWidget(
                setting: widget.animation!,
                child: _notStandalone(context),
              )
            : _notStandalone(context);
  }
}
