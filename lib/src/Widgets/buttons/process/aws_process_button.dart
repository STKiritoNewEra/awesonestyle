import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AwsStateProcessButton { expecting, process, ok, error }

class AwsProcessButton extends StatefulWidget {
  final bool cupertinoThemeMode;
  final Size? size;
  final EdgeInsetsGeometry? padding;
  final AwsDefinitionProcessButton init;
  final AwsDefinitionProcessButton accion;
  final AwsDefinitionProcessButton ok;
  final AwsDefinitionProcessButton error;
  final Future<(bool, String)> Function() process;
  final bool resetStateAfterError;
  final int resetStateAfterErrorDuration;
  final void Function(bool value, String? message) result;

  const AwsProcessButton({
    super.key,
    this.size,
    this.padding,
    required this.init,
    required this.accion,
    required this.ok,
    required this.error,
    required this.process,
    required this.result,
    this.resetStateAfterError = true,
    this.resetStateAfterErrorDuration = 1500,
    this.cupertinoThemeMode = false,
  });

  @override
  State<AwsProcessButton> createState() => AwsProcessButtonState();
}

class AwsProcessButtonState extends State<AwsProcessButton> {
  // Declaración de dos variables 'state' y 'definition' de tipo AwsProcessStateButtonDev y AwsDefinitionProcessButton respectivamente.
  late AwsStateProcessButton state;
  late AwsDefinitionProcessButton definition;

  @override
  void initState() {
    // Inicialización de la variable 'state' con el valor AwsProcessStateButtonDev.nulls
    state = AwsStateProcessButton.expecting;

    // Inicialización de la variable 'definition' con el valor recibido en 'widget.init'
    definition = widget.init;

    // Llamada al método 'initState' de la clase padre (superclase)
    super.initState();
  }

  //Method that changes the dark mode is activated and changes the button style to its corresponding mode.
  BoxDecoration themeMode(BuildContext context,
      {required AwsDecorationProcessButton style}) {
    var darkStyle =
        style.copyWith(color: style.darkColor, boxShadow: style.darkBoxShadow);
    var lightStyle =
        style.copyWith(color: style.color, boxShadow: style.boxShadow);
    if (widget.cupertinoThemeMode) {
      if (CupertinoTheme.of(context).brightness == Brightness.dark) {
        return darkStyle;
      }
      return lightStyle;
    } else {
      if (Theme.of(context).brightness == Brightness.dark) {
        return darkStyle;
      }
      return lightStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AwsAniWidget(
        setting: definition.animation,
        child: InkWell(
          borderRadius: definition.style.getBorderRadius,
          mouseCursor: state == AwsStateProcessButton.expecting
              ? SystemMouseCursors.click
              : null,
          child: Container(
            height: widget.size?.height,
            width: widget.size?.width,
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: themeMode(context, style: definition.style),
            child: definition.indicator != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      definition.indicator!,
                      Text(
                        definition.label,
                        style: definition.style.textStyle,
                      ),
                    ],
                  )
                : Text(
                    definition.label,
                    style: definition.style.textStyle,
                  ),
          ),
          onTap: () async {
            if (state != AwsStateProcessButton.process &&
                state != AwsStateProcessButton.ok &&
                state != AwsStateProcessButton.error) {
              state = AwsStateProcessButton.process;
              definition = widget.accion;
              setState(() {});
              try {
                (bool, String) intent = await widget.process();
                if (intent.$1) {
                  okProcess(intent.$2);
                } else {
                  errorProcess(intent.$2);
                }
              } catch (e) {
                errorProcess(e.toString());
              }
            }
          },
        ));
  }

  //If the process was not successful, it will return the value false with an unknown process or error message.
  void errorProcess(String message) {
    state = AwsStateProcessButton.error;
    definition = widget.error;
    setState(() {});
    if (definition.animation.delay != null) {
      Future.delayed(definition.animation.delay!,
          () => widget.result.call(false, message));
    } else {
      widget.result.call(false, message);
    }
    if (widget.resetStateAfterError) {
      Future.delayed(
          Duration(milliseconds: widget.resetStateAfterErrorDuration), () {
        state = AwsStateProcessButton.expecting;
        definition = widget.init;

        setState(() {});
      });
    }
  }

  //If the process was carried out successfully, it will return the value true with a message from the process.
  void okProcess(String message) {
    state = AwsStateProcessButton.ok;
    definition = widget.ok;
    setState(() {});

    if (definition.animation.delay != null) {
      Future.delayed(
          definition.animation.delay!, () => widget.result.call(true, message));
    } else {
      widget.result.call(true, message);
    }
  }
}

/// Class that defines the specific decoration for an [AwsProcessButton] process button.
class AwsDecorationProcessButton extends BoxDecoration {
  /// [textStyle]: Text style for the button.
  final TextStyle? textStyle;

  /// [darkColor]: Color when dark mode is activated.
  final Color darkColor;

  /// [darkBoxShadow]: List of boxShadow when dark mode is activated.
  final List<BoxShadow>? darkBoxShadow;

  /// Constructor for the process button decoration of [AwsProcessButton].
  const AwsDecorationProcessButton({
    required Color color,
    required this.darkColor,
    required BorderRadius borderRadius,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
    this.darkBoxShadow,
    Gradient? gradient,
    this.textStyle,
  }) : super(
          color: color,
          borderRadius: borderRadius,
          border: border,
          boxShadow: boxShadow,
          gradient: gradient,
        );

  /// [getBorderRadius]: Gets the border radius of the decoration.
  BorderRadius get getBorderRadius => super.borderRadius as BorderRadius;

  /// Static method to create an instance of [AwsDecorationProcessButton] with default values.
  static AwsDecorationProcessButton defect(
          {required Color color,
          required Color darkColor,
          required List<BoxShadow> boxShadow,
          required List<BoxShadow> darkBoxShadow}) =>
      AwsDecorationProcessButton(
        color: color,
        darkColor: darkColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: boxShadow,
        darkBoxShadow: darkBoxShadow,
      );
}

/// Class representing the definition of a process button with [AwsProcessButton].
class AwsDefinitionProcessButton {
  /// [indicator]: Widget to be used as an indicator.
  final Widget? indicator;

  /// [label]: Label for the button.
  final String label;

  /// [style]: Style configuration for the button.
  final AwsDecorationProcessButton style;

  /// [animation]: Animation settings for the button.
  final AwsAniSetting animation;

  /// Constructs an instance of [AwsDefinitionProcessButton].
  AwsDefinitionProcessButton({
    this.indicator,
    required this.label,
    required this.style,
    required this.animation,
  });
}
