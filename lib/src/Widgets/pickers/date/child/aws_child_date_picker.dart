import 'package:awesonestyle/src/services/services_link.dart';
import 'package:awesonestyle/src/widgets/pickers/date/child/theme/aws_theme_child_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsChildDatePicker extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final AwsThemeChildDatePicker? theme;
  final int? length;
  final bool year;
  final String prefix;
  final String? hint;
  final void Function(int)? onSelectedItemChanged;

  AwsChildDatePicker({
    Key? key,
    this.theme,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.length,
    this.year = false,
    required this.prefix,
    this.hint,
    this.onSelectedItemChanged,
  }) : super(key: key);
  @override
  Widget build(context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: context.height(height ?? 5),
        width: context.width(width ?? 20),
        padding: padding,
        margin: margin ?? const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme?.backgroundColor ?? Colors.black.withOpacity(0.1),
          borderRadius: theme?.borderRadius ?? BorderRadius.circular(20),
          border: theme?.border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: hint != null
                  ? Text(
                      hint!,
                      style: theme?.hint ??
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                    )
                  : null,
            ),
            const SizedBox(width: 5),
            Text(
              prefix,
              style: theme?.prefix ?? const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      onTap: () => showCupertinoModalPopup<int>(
        context: context,
        builder: (context) => SizedBox(
          height: theme?.content?.height ?? 300,
          child: CupertinoPicker(
            itemExtent: theme?.content?.extent ?? 50,
            onSelectedItemChanged: onSelectedItemChanged,
            children: year
                ? List.generate(
                    AwsGenerators.year().length,
                    (index) => Text(
                          AwsGenerators.year()[index].toString(),
                          style: theme?.content?.style ??
                              const TextStyle(color: Colors.white),
                        ))
                : List.generate(
                    length ?? 31,
                    (index) => Text(
                      (index + 1).toString(),
                      style: theme?.content?.style ??
                          const TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
