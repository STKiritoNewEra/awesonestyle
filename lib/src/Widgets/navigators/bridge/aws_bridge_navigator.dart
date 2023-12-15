import 'dart:io';

import 'package:awesonestyle/src/services/services_link.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/buttons/aws_footer_button_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/buttons/aws_header_button_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/buttons/aws_item_button_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/painter/aws_painter_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/theme/aws_theme_bridge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsBridgeNavigator<T> extends StatefulWidget {
  final Axis direction;
  final bool expanded;
  final bool spaceBetween;
  final bool safeArea;
  final EdgeInsetsGeometry? padding;
  final AwsThemeBridge? theme;
  final T initValue;
  final void Function(T value) onSelected;
  final AwsHeaderButtonBridge? header;
  final List<AwsItemButtonBridge<T>> items;
  final AwsFooterButtonBridge? footer;

  const AwsBridgeNavigator({
    super.key,
    required this.direction,
    this.expanded = false,
    this.safeArea = true,
    this.padding,
    this.header,
    required this.items,
    this.footer,
    required this.initValue,
    required this.onSelected,
    this.theme,
    this.spaceBetween = false,
  });

  @override
  State<AwsBridgeNavigator<T>> createState() => _AwsBridgeNavigatorState<T>();
}

class _AwsBridgeNavigatorState<T> extends State<AwsBridgeNavigator<T>> {
  AwsThemeBridge _defaultTheme() {
    if (widget.theme == null) {
      return AwsThemeBridge.base();
    } else {
      return widget.theme!;
    }
  }

  late T selectedItem;
  bool isExpanded = false;

  @override
  void initState() {
    selectedItem = widget.initValue;
    isExpanded = false;
    super.initState();
  }

  Widget _defaultHeader(BuildContext context, {required bool isExpanded}) {
    if (widget.header != null &&
        widget.direction == Axis.vertical &&
        isExpanded) {
      return Tooltip(
        message: widget.header!.title,
        child: InkWell(
          onTap: widget.header!.onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Flex(
              direction: Axis.vertical,
              children: [
                widget.header!.leading,
                Text(
                  widget.header!.title,
                  style: widget.header!.titleStyle,
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (widget.header != null &&
        widget.direction == Axis.horizontal &&
        widget.expanded) {
      return Tooltip(
        message: widget.header!.title,
        child: InkWell(
          onTap: widget.header!.onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: context.width(20),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                widget.header!.leading,
                Flexible(
                  child: Text(
                    widget.header!.title,
                    style: widget.header!.titleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Tooltip(
        message: widget.header!.title,
        child: InkWell(
          onTap: widget.header!.onTap,
          child: Container(
              margin: const EdgeInsets.all(10), child: widget.header!.leading),
        ));
  }

  IconData _defaultFooterMaximizar(bool maximizar) {
    if (maximizar) {
      return (CupertinoIcons.arrow_down_right_arrow_up_left);
    } else {
      return (CupertinoIcons.arrow_up_left_arrow_down_right);
    }
  }

  Widget _defaultFooter(
      {required bool isExpanded, required void Function(bool state) shift}) {
    IconData icon = CupertinoIcons.arrow_up_left_arrow_down_right;

    bool maximizar = false;
    if (widget.footer == null &&
        widget.direction == Axis.horizontal &&
        !isExpanded) {
      return Container();
    }
    if (widget.footer == null &&
        widget.direction == Axis.vertical &&
        widget.expanded) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: Icon(
            icon,
            color: widget.theme?.footerDefaultColor,
          ),
          onPressed: () => setState(() {
            maximizar = !maximizar;
            shift.call(maximizar);

            icon = _defaultFooterMaximizar(maximizar);
          }),
        ),
      );
    } else {
      setState(() {
        shift.call(false);
      });

      if (widget.footer != null &&
          widget.direction == Axis.vertical &&
          !isExpanded) {
        return InkWell(
          onTap: widget.footer!.onTap,
          child: Container(
              margin: const EdgeInsets.all(10), child: widget.footer!.leading),
        );
      }
      return InkWell(
        onTap: widget.footer!.onTap,
        child: Container(
            margin: const EdgeInsets.all(10), child: widget.footer!.leading),
      );
    }
  }

  double _defaultWidth(BuildContext context, {required bool isExpanded}) {
    if (isExpanded) {
      if (widget.direction == Axis.vertical) {
        if (Platform.isAndroid || Platform.isIOS) {
          return context.width(45);
        } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
          return context.width(18);
        } else {
          return context.width(23);
        }
      } else if (widget.direction == Axis.horizontal) {
        return context.width(13);
      } else {
        return context.width(100);
      }
    } else {
      if (widget.direction == Axis.vertical) {
        if (Platform.isAndroid || Platform.isIOS) {
          return context.width(13);
        } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
          return context.width(5);
        } else {
          return context.width(12);
        }
      } else if (widget.direction == Axis.horizontal) {
        return context.width(100);
      } else {
        return context.width(100);
      }
    }
  }

  double _defaultHeight(BuildContext context, {required bool isExpanded}) {
    if (isExpanded) {
      if (widget.direction == Axis.vertical) {
        return context.height(100);
      } else if (widget.direction == Axis.horizontal) {
        return context.height(13);
      } else {
        return context.height(100);
      }
    } else {
      if (widget.direction == Axis.vertical) {
        return context.height(100);
      } else if (widget.direction == Axis.horizontal) {
        return context.height(7);
      } else {
        return context.height(100);
      }
    }
  }

  Axis _defaultConvertDirection(Axis direction) {
    if (direction == Axis.vertical) {
      return Axis.horizontal;
    } else {
      return Axis.vertical;
    }
  }

  Material _material(BuildContext context, bool isExpanded, T selectedItem) {
    if (widget.theme?.bar.borderGradient != null) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            gradient: widget.theme?.bar.borderGradient,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: _defaultTheme().bar.color,
              border: _defaultTheme().bar.border,
              borderRadius: _defaultTheme().bar.borderRadius,
              boxShadow: _defaultTheme().bar.boxShadow,
              gradient: _defaultTheme().bar.gradient,
              backgroundBlendMode: _defaultTheme().bar.backgroundBlendMode,
            ),
            width: _defaultWidth(context, isExpanded: isExpanded),
            height: _defaultHeight(context, isExpanded: isExpanded),
            child: _content(context,
                isExpanded: isExpanded,
                selectedItem: selectedItem,
                paint: false),
          ),
        ),
      );
    } else {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            color: _defaultTheme().bar.color,
            border: _defaultTheme().bar.border,
            borderRadius: _defaultTheme().bar.borderRadius,
            boxShadow: _defaultTheme().bar.boxShadow,
            gradient: _defaultTheme().bar.gradient,
            backgroundBlendMode: _defaultTheme().bar.backgroundBlendMode,
          ),
          width: _defaultWidth(context, isExpanded: isExpanded),
          height: _defaultHeight(context, isExpanded: isExpanded),
          child: _content(context,
              isExpanded: isExpanded, selectedItem: selectedItem, paint: false),
        ),
      );
    }
  }

  Material _painter(BuildContext context, bool isExpanded, T selectedItem) {
    if (widget.theme?.bar.borderGradient != null) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            gradient: widget.theme?.bar.borderGradient,
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              color: _defaultTheme().bar.color,
              border: _defaultTheme().bar.border,
              borderRadius: _defaultTheme().bar.borderRadius,
              boxShadow: _defaultTheme().bar.boxShadow,
              gradient: _defaultTheme().bar.gradient,
              backgroundBlendMode: _defaultTheme().bar.backgroundBlendMode,
            ),
            width: _defaultWidth(context, isExpanded: isExpanded),
            height: _defaultHeight(context, isExpanded: isExpanded),
            child: _content(context,
                isExpanded: isExpanded,
                selectedItem: selectedItem,
                paint: true),
          ),
        ),
      );
    } else {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            color: _defaultTheme().bar.color,
            border: _defaultTheme().bar.border,
            borderRadius: _defaultTheme().bar.borderRadius,
            boxShadow: _defaultTheme().bar.boxShadow,
            gradient: _defaultTheme().bar.gradient,
            backgroundBlendMode: _defaultTheme().bar.backgroundBlendMode,
          ),
          width: _defaultWidth(context, isExpanded: isExpanded),
          height: _defaultHeight(context, isExpanded: isExpanded),
          child: _content(context,
              isExpanded: isExpanded, selectedItem: selectedItem, paint: true),
        ),
      );
    }
  }

  CustomPainter? _paint(bool paint) {
    if (paint) {
      return AwsPainterBridge(bubbleRadius: 18, maxBubbleRadius: 23);
    } else {
      return null;
    }
  }

  Widget _content(BuildContext context,
      {required bool isExpanded,
      required T selectedItem,
      required bool paint}) {
    return Flex(
      direction: widget.direction,
      mainAxisAlignment: widget.spaceBetween
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        if (widget.header != null)
          AwsAniWidget(
              setting: AwsAniSetting(
                animation: widget.direction == Axis.vertical
                    ? AwsAnimation.fadeInLeft
                    : AwsAnimation.fadeInUp,
              ),
              child: _defaultHeader(context, isExpanded: isExpanded)),
        if (widget.spaceBetween) const Spacer(),
        Flex(
          direction: widget.direction,
          children: widget.items
              .map(
                (item) => AwsAniWidget(
                  setting: AwsAniSetting(
                    animation: widget.direction == Axis.vertical
                        ? AwsAnimation.fadeInLeft
                        : AwsAnimation.fadeInUp,
                  ),
                  child: InkWell(
                    onTap: () => setState(
                      () {
                        selectedItem = item.value;

                        widget.onSelected.call(item.value);
                      },
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: isExpanded == true
                          ? Flex(
                              direction:
                                  _defaultConvertDirection(widget.direction),
                              children: [
                                if (_defaultConvertDirection(
                                        widget.direction) ==
                                    Axis.vertical)
                                  const SizedBox(height: 15),
                                if (_defaultConvertDirection(
                                        widget.direction) ==
                                    Axis.horizontal)
                                  const SizedBox(width: 15),
                                CustomPaint(
                                  painter: selectedItem == item.value
                                      ? _paint(paint)
                                      : null,
                                  child: Icon(
                                    item.icon,
                                    color: selectedItem == item.value
                                        ? _defaultTheme().item.isSelectedColor
                                        : _defaultTheme().item.notSelectedColor,
                                  ),
                                ),
                                if (_defaultConvertDirection(
                                        widget.direction) ==
                                    Axis.vertical)
                                  const SizedBox(height: 15),
                                if (_defaultConvertDirection(
                                        widget.direction) ==
                                    Axis.horizontal)
                                  const SizedBox(width: 15),
                                Text(
                                  item.label,
                                  style:
                                      _defaultTheme().item.labelStyle.copyWith(
                                            color: selectedItem == item.value
                                                ? _defaultTheme()
                                                    .item
                                                    .isSelectedColor
                                                : _defaultTheme()
                                                    .item
                                                    .notSelectedColor,
                                          ),
                                ),
                              ],
                            )
                          : CustomPaint(
                              painter: selectedItem == item.value
                                  ? _paint(paint)
                                  : null,
                              child: Icon(
                                item.icon,
                                color: selectedItem == item.value
                                    ? _defaultTheme().item.isSelectedColor
                                    : _defaultTheme().item.notSelectedColor,
                              ),
                            ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        if (widget.spaceBetween) const Spacer(),
        if (!widget.spaceBetween && widget.direction == Axis.vertical)
          const Spacer(),
        if (widget.expanded)
          AwsAniWidget(
            setting: AwsAniSetting(
              animation: widget.direction == Axis.vertical
                  ? AwsAnimation.fadeInLeft
                  : AwsAnimation.fadeInUp,
            ),
            child: _defaultFooter(
              isExpanded: isExpanded,
              shift: (state) => isExpanded = state,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.theme != null) {
      if (widget.theme!.painter) {
        return SafeArea(
          left: widget.safeArea,
          top: widget.safeArea,
          right: widget.safeArea,
          bottom: widget.safeArea,
          child: Padding(
            padding: widget.padding ?? EdgeInsets.all(0),
            child: _painter(context, isExpanded, selectedItem),
          ),
        );
      } else {
        return SafeArea(
          left: widget.safeArea,
          top: widget.safeArea,
          right: widget.safeArea,
          bottom: widget.safeArea,
          child: Padding(
            padding: widget.padding ?? EdgeInsets.all(0),
            child: _material(context, isExpanded, selectedItem),
          ),
        );
      }
    } else {
      return SafeArea(
        left: widget.safeArea,
        top: widget.safeArea,
        right: widget.safeArea,
        bottom: widget.safeArea,
        child: Padding(
            padding: widget.padding ?? EdgeInsets.all(0),
            child: _material(context, isExpanded, selectedItem)),
      );
    }
  }
}
