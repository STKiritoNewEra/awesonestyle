import 'package:awesonestyle/src/widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:flutter/material.dart';

enum AwsProcessStateButtonOld { nulls, actions, ok, error }

@Deprecated(
    'AwsProcessButtonOld esta declarado como obsoleta, utiliza AwsProcessButton en su lugar')
class AwsProcessButtonOld extends StatefulWidget {
  final bool _resetStateAfterError;
  final int _resetStateAfterErrorDuration;
  final Future<bool> Function() _actions;
  final void Function()? _ok;
  final void Function()? _error;
  final Widget _initIcon;
  final Widget _initLabel;
  final Widget _actionsIcon;
  final Widget _actionsLabel;
  final Widget _okIcon;
  final Widget _okLabel;
  final Widget _errorIcon;
  final Widget _errorLabel;
  final ButtonStyle? _initStyle;
  final ButtonStyle? _actionsStyle;
  final ButtonStyle? _okStyle;
  final ButtonStyle? _errorStyle;
  final AwsAnimation _initAnimation;
  final AwsAnimation _actionsAnimation;
  final AwsAnimation _okAnimation;
  final AwsAnimation _errorAnimation;
  final Duration? _initAnimationDuration;
  final Duration? _actionsAnimationDuration;
  final Duration? _okAnimationDuration;
  final Duration? _errorAnimationDuration;
  final double? _angle;
  final double? _sizeY;
  final int _delayOk;
  final int _delayError;

  const AwsProcessButtonOld(
      {bool resetStateAfterError = true,
      int resetStateAfterErrorDuration = 1500,
      ButtonStyle? initStyle,
      ButtonStyle? actionsStyle,
      ButtonStyle? okStyle,
      ButtonStyle? errorStyle,
      required Future<bool> Function() actions,
      void Function()? ok,
      void Function()? error,
      Widget initIcon = const Icon(Icons.login_outlined),
      Widget initLabel = const Text('Login'),
      Widget actionsIcon = const CircularProgressIndicator(
        color: Colors.white,
      ),
      Widget actionsLabel = const Text('Verificando'),
      Widget okIcon = const Icon(Icons.check_circle),
      Widget okLabel = const Text('Verificado'),
      Widget errorIcon = const Icon(Icons.error_outline),
      Widget errorLabel = const Text('Error'),
      AwsAnimation initAnimation = AwsAnimation.zoomIn,
      AwsAnimation actionsAnimation = AwsAnimation.pulse,
      AwsAnimation okAnimation = AwsAnimation.flash,
      AwsAnimation errorAnimation = AwsAnimation.flash,
      Duration? initAnimationDuration,
      Duration? actionsAnimationDuration,
      Duration? okAnimationDuration,
      Duration? errorAnimationDuration,
      double? angle,
      double? sizeY,
      int delayOk = 700,
      int delayError = 0,
      super.key})
      : _actions = actions,
        _ok = ok,
        _error = error,
        _initIcon = initIcon,
        _initLabel = initLabel,
        _actionsIcon = actionsIcon,
        _actionsLabel = actionsLabel,
        _okIcon = okIcon,
        _okLabel = okLabel,
        _errorIcon = errorIcon,
        _errorLabel = errorLabel,
        _initStyle = initStyle,
        _actionsStyle = actionsStyle,
        _okStyle = okStyle,
        _errorStyle = errorStyle,
        _initAnimation = initAnimation,
        _actionsAnimation = actionsAnimation,
        _okAnimation = okAnimation,
        _errorAnimation = errorAnimation,
        _initAnimationDuration = initAnimationDuration,
        _actionsAnimationDuration = actionsAnimationDuration,
        _okAnimationDuration = okAnimationDuration,
        _errorAnimationDuration = errorAnimationDuration,
        _angle = angle,
        _sizeY = sizeY,
        _delayOk = delayOk,
        _delayError = delayError,
        _resetStateAfterError = resetStateAfterError,
        _resetStateAfterErrorDuration = resetStateAfterErrorDuration;

  @override
  State<AwsProcessButtonOld> createState() => AwsProcessButtonOldState();
}

class AwsProcessButtonOldState extends State<AwsProcessButtonOld> {
  late AwsProcessStateButtonOld _state;
  late Widget _icon;
  late Widget _label;
  late ButtonStyle _style;
  late AwsAnimation _animation;
  late Duration? _animationDuration;
  @override
  void initState() {
    _state = AwsProcessStateButtonOld.nulls;
    _icon = widget._initIcon;
    _label = widget._initLabel;
    _style = widget._initStyle ?? AwsStyleProcessButtonOld.nulls;
    _animation = widget._initAnimation;
    _animationDuration = widget._initAnimationDuration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AwsAniWidget(
      setting:
          AwsAniSetting(animation: _animation, duration: _animationDuration),
      child: SizedBox(
        height: widget._sizeY,
        child: TextButton.icon(
          onPressed: () async {
            if (_state != AwsProcessStateButtonOld.actions) {
              _state = AwsProcessStateButtonOld.actions;
              _icon =
                  SizedBox(height: widget._angle, child: widget._actionsIcon);
              _label = widget._actionsLabel;
              _style = widget._actionsStyle ?? AwsStyleProcessButtonOld.actions;
              _animation = widget._actionsAnimation;
              _animationDuration = widget._actionsAnimationDuration;
              setState(() {});
              if (await widget._actions.call()) {
                _state = AwsProcessStateButtonOld.ok;
                _icon = widget._okIcon;
                _label = widget._okLabel;
                _style = widget._okStyle ?? AwsStyleProcessButtonOld.ok;
                _animation = widget._okAnimation;
                _animationDuration = widget._okAnimationDuration;
                setState(() {});
                if (widget._delayOk > 0) {
                  Future.delayed(Duration(milliseconds: widget._delayOk),
                      () => widget._ok?.call());
                } else {
                  widget._ok?.call();
                }
              } else {
                _state = AwsProcessStateButtonOld.error;
                _icon = widget._errorIcon;
                _label = widget._errorLabel;
                _style = widget._errorStyle ?? AwsStyleProcessButtonOld.error;
                _animation = widget._errorAnimation;
                _animationDuration = widget._errorAnimationDuration;
                setState(() {});
                if (widget._delayError > 0) {
                  Future.delayed(Duration(milliseconds: widget._delayError),
                      () => widget._error?.call());
                } else {
                  widget._error?.call();
                }
                if (widget._resetStateAfterError) {
                  Future.delayed(
                      Duration(
                          milliseconds: widget._resetStateAfterErrorDuration),
                      () {
                    _state = AwsProcessStateButtonOld.nulls;
                    _icon = widget._initIcon;
                    _label = widget._initLabel;
                    _style =
                        widget._initStyle ?? AwsStyleProcessButtonOld.nulls;
                    _animation = widget._initAnimation;
                    _animationDuration = widget._initAnimationDuration;
                    setState(() {});
                  });
                }
              }
            }
          },
          icon: _icon,
          label: _label,
          style: _style,
        ),
      ),
    );
  }
}

class AwsStyleProcessButtonOld {
  static final ButtonStyle nulls = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
    foregroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.white),
    padding:
        const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.all(10)),
    side: const MaterialStatePropertyAll<BorderSide>(
        BorderSide(color: Colors.white)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
  static final ButtonStyle actions = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.blue),
    foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.blueAccent),
    padding:
        const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.all(10)),
    side: const MaterialStatePropertyAll<BorderSide>(
        BorderSide(color: Colors.blue)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
  static final ButtonStyle ok = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.green),
    foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.greenAccent),
    padding:
        const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.all(10)),
    side: const MaterialStatePropertyAll<BorderSide>(
        BorderSide(color: Colors.green)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
  static final ButtonStyle error = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.red),
    foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.redAccent),
    padding:
        const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.all(10)),
    side: const MaterialStatePropertyAll<BorderSide>(
        BorderSide(color: Colors.red)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
