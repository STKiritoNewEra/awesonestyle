import 'package:awesonestyle/src/widgets/buttons/motley/theme/aws_theme_motley_button.dart';
import 'package:awesonestyle/src/widgets/buttons/motley/theme/gradient/aws_gradient_motley_button.dart';
import 'package:awesonestyle/src/widgets/buttons/motley/theme/shadow/aws_shadow_motley_button.dart';
import 'package:flutter/material.dart';

class AwsMotleyButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final void Function()? onPressed;
  final AwsThemeMotleyButton? theme;
  AwsMotleyButton({
    Key? key,
    this.borderRadius,
    this.onPressed,
    this.theme,
    required this.child,
  }) : super(key: key);

  static final AwsGradientMotleyButton _gradientSettingsDefault =
      AwsGradientMotleyButton(
    backgroundBlendMode: BlendMode.srcOver,
    colors: [
      const Color(0xff89fa3f),
      const Color(0xff2196f3),
    ],
    stops: [
      0,
      1,
    ],
  );
  static final _boxShadowSettingsDefault =
      AwsShadowMotleyButton(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return _NormalButton(
      borderRadius: borderRadius,
      boxShadow: theme?.boxShadow ?? false,
      boxShadowSettings: theme?.shadow ?? _boxShadowSettingsDefault,
      gradientSettings: theme?.gradient ?? _gradientSettingsDefault,
      onPressed: onPressed,
      child: child,
    );
  }

  static Widget text(
      {Key? key,
      BorderRadiusGeometry? borderRadius,
      AwsGradientMotleyButton? gradientSettings,
      AwsShadowMotleyButton? boxShadowSettings,
      bool boxShadow = false,
      required Text text,
      required void Function()? onPressed}) {
    return _ButtonText(
      boxShadowSettings: boxShadowSettings ?? _boxShadowSettingsDefault,
      gradientSettings: gradientSettings ?? _gradientSettingsDefault,
      onPressed: onPressed,
      text: text,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
    );
  }
}

class _NormalButton extends StatefulWidget {
  final BorderRadiusGeometry? _borderRadius;
  final Widget _child;
  final AwsGradientMotleyButton? _gradientSettings;
  final void Function()? _onPressed;
  final bool _boxShadow;
  final AwsShadowMotleyButton? _boxShadowSettings;
  _NormalButton({
    Key? key,
    BorderRadiusGeometry? borderRadius,
    required Widget child,
    AwsGradientMotleyButton? gradientSettings,
    void Function()? onPressed,
    bool boxShadow = false,
    AwsShadowMotleyButton? boxShadowSettings,
  })  : _borderRadius = borderRadius,
        _child = child,
        _gradientSettings = gradientSettings,
        _onPressed = onPressed,
        _boxShadowSettings = boxShadowSettings,
        _boxShadow = boxShadow,
        super(key: key);

  @override
  State<_NormalButton> createState() => _NormalButtonState();
}

class _NormalButtonState extends State<_NormalButton> {
  bool _activeShadow = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        _activeShadow = true;
        print('dentro');
      }),
      onExit: (_) => setState(() {
        _activeShadow = false;
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget._borderRadius ?? BorderRadius.circular(30),
          boxShadow: widget._boxShadow == false
              ? null
              : _activeShadow
                  ? [
                      BoxShadow(
                        color: widget._boxShadowSettings?.color ??
                            AwsMotleyButton._boxShadowSettingsDefault.color,
                        blurRadius: widget._boxShadowSettings?.blurRadius ??
                            AwsMotleyButton
                                ._boxShadowSettingsDefault.blurRadius,
                        blurStyle: widget._boxShadowSettings?.blurStyle ??
                            AwsMotleyButton._boxShadowSettingsDefault.blurStyle,
                      ),
                    ]
                  : null,
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget._gradientSettings?.colors ??
                AwsMotleyButton._gradientSettingsDefault.colors,
            stops: widget._gradientSettings?.stops ??
                AwsMotleyButton._gradientSettingsDefault.stops,
          ),
          backgroundBlendMode: widget._gradientSettings?.backgroundBlendMode ??
              AwsMotleyButton._gradientSettingsDefault.backgroundBlendMode,
        ),
        child: TextButton(
          onPressed: widget._onPressed,
          child: widget._child,
        ),
      ),
    );
  }
}

class _ButtonText extends StatefulWidget {
  final BorderRadiusGeometry? _borderRadius;
  final Text _text;
  final AwsGradientMotleyButton? _gradientSettings;
  final void Function()? _onPressed;
  final bool _boxShadow;
  final AwsShadowMotleyButton? _boxShadowSettings;
  _ButtonText({
    Key? key,
    BorderRadiusGeometry? borderRadius,
    required Text text,
    AwsGradientMotleyButton? gradientSettings,
    void Function()? onPressed,
    required bool boxShadow,
    AwsShadowMotleyButton? boxShadowSettings,
  })  : _borderRadius = borderRadius,
        _text = text,
        _gradientSettings = gradientSettings,
        _onPressed = onPressed,
        _boxShadowSettings = boxShadowSettings,
        _boxShadow = boxShadow,
        super(key: key);

  @override
  State<_ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<_ButtonText> {
  bool _activeShadow = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        _activeShadow = true;
      }),
      onExit: (_) => setState(() {
        _activeShadow = false;
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget._borderRadius ?? BorderRadius.circular(30),
          boxShadow: widget._boxShadow == false
              ? null
              : _activeShadow
                  ? [
                      BoxShadow(
                        color: widget._boxShadowSettings?.color ??
                            AwsMotleyButton._boxShadowSettingsDefault.color,
                        blurRadius: widget._boxShadowSettings?.blurRadius ??
                            AwsMotleyButton
                                ._boxShadowSettingsDefault.blurRadius,
                        blurStyle: widget._boxShadowSettings?.blurStyle ??
                            AwsMotleyButton._boxShadowSettingsDefault.blurStyle,
                      ),
                    ]
                  : null,
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget._gradientSettings?.colors ??
                AwsMotleyButton._gradientSettingsDefault.colors,
            stops: widget._gradientSettings?.stops ??
                AwsMotleyButton._gradientSettingsDefault.stops,
          ),
          backgroundBlendMode: widget._gradientSettings?.backgroundBlendMode ??
              AwsMotleyButton._gradientSettingsDefault.backgroundBlendMode,
        ),
        child: TextButton(
          onPressed: widget._onPressed,
          child: widget._text,
        ),
      ),
    );
  }
}
