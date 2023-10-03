import 'package:awesonestyle/src/Services/services_link.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/buttons/aws_footer_button_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/buttons/aws_header_button_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/buttons/aws_item_button_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/painter/aws_painter_bridge.dart';
import 'package:awesonestyle/src/widgets/navigators/bridge/theme/aws_theme_bridge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AwsBridgeNavigator<T> extends HookWidget {
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

  AwsThemeBridge _defaultTheme() {
    if (theme == null) {
      return AwsThemeBridge.base();
    } else {
      return theme!;
    }
  }

  Widget _defaultHeader(BuildContext context, {required bool isExpanded}) {
    if (header != null && direction == Axis.vertical && isExpanded) {
      return Tooltip(
        message: header!.title,
        child: InkWell(
          onTap: header!.onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Flex(
              direction: Axis.vertical,
              children: [
                header!.leading,
                Text(
                  header!.title,
                  style: header!.titleStyle,
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (header != null && direction == Axis.horizontal && expanded) {
      return Tooltip(
        message: header!.title,
        child: InkWell(
          onTap: header!.onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: context.width(20),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                header!.leading,
                Flexible(
                  child: Text(
                    header!.title,
                    style: header!.titleStyle,
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
        message: header!.title,
        child: InkWell(
          onTap: header!.onTap,
          child: Container(
              margin: const EdgeInsets.all(10), child: header!.leading),
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
    ValueNotifier<IconData> icon =
        useState(CupertinoIcons.arrow_up_left_arrow_down_right);

    ValueNotifier<bool> maximizar = useState(false);
    if (footer == null && direction == Axis.horizontal && !isExpanded) {
      return Container();
    }
    if (footer == null && direction == Axis.vertical && expanded) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: Icon(
            icon.value,
            color: theme?.footerDefaultColor,
          ),
          onPressed: () {
            maximizar.value = !maximizar.value;
            shift.call(maximizar.value);

            icon.value = _defaultFooterMaximizar(maximizar.value);
          },
        ),
      );
    } else {
      shift.call(false);

      if (footer != null && direction == Axis.vertical && !isExpanded) {
        return InkWell(
          onTap: footer!.onTap,
          child: Container(
              margin: const EdgeInsets.all(10), child: footer!.leading),
        );
      }
      return InkWell(
        onTap: footer!.onTap,
        child:
            Container(margin: const EdgeInsets.all(10), child: footer!.leading),
      );
    }
  }

  double _defaultWidth(BuildContext context, {required bool isExpanded}) {
    if (isExpanded) {
      if (direction == Axis.vertical) {
        return context.width(45);
      } else if (direction == Axis.horizontal) {
        return context.width(13);
      } else {
        return context.width(100);
      }
    } else {
      if (direction == Axis.vertical) {
        return context.width(13);
      } else if (direction == Axis.horizontal) {
        return context.width(100);
      } else {
        return context.width(100);
      }
    }
  }

  double _defaultHeight(BuildContext context, {required bool isExpanded}) {
    if (isExpanded) {
      if (direction == Axis.vertical) {
        return context.height(100);
      } else if (direction == Axis.horizontal) {
        return context.height(13);
      } else {
        return context.height(100);
      }
    } else {
      if (direction == Axis.vertical) {
        return context.height(100);
      } else if (direction == Axis.horizontal) {
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

  Material _material(BuildContext context, ValueNotifier<bool> isExpanded,
      ValueNotifier<dynamic> selectedItem) {
    if (theme?.bar.borderGradient != null) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            gradient: theme?.bar.borderGradient,
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
            width: _defaultWidth(context, isExpanded: isExpanded.value),
            height: _defaultHeight(context, isExpanded: isExpanded.value),
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
          width: _defaultWidth(context, isExpanded: isExpanded.value),
          height: _defaultHeight(context, isExpanded: isExpanded.value),
          child: _content(context,
              isExpanded: isExpanded, selectedItem: selectedItem, paint: false),
        ),
      );
    }
  }

  Material _painter(BuildContext context, ValueNotifier<bool> isExpanded,
      ValueNotifier<dynamic> selectedItem) {
    if (theme?.bar.borderGradient != null) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            gradient: theme?.bar.borderGradient,
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
            width: _defaultWidth(context, isExpanded: isExpanded.value),
            height: _defaultHeight(context, isExpanded: isExpanded.value),
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
          width: _defaultWidth(context, isExpanded: isExpanded.value),
          height: _defaultHeight(context, isExpanded: isExpanded.value),
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
      {required ValueNotifier<bool> isExpanded,
      required ValueNotifier<dynamic> selectedItem,
      required bool paint}) {
    return Flex(
      direction: direction,
      mainAxisAlignment: spaceBetween
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        if (header != null)
          AwsAniWidget(
              setting: AwsAniSetting(
                animation: direction == Axis.vertical
                    ? AwsAnimation.fadeInLeft
                    : AwsAnimation.fadeInUp,
              ),
              child: _defaultHeader(context, isExpanded: isExpanded.value)),
        if (spaceBetween) const Spacer(),
        Flex(
          direction: direction,
          children: items
              .map(
                (item) => AwsAniWidget(
                  setting: AwsAniSetting(
                    animation: direction == Axis.vertical
                        ? AwsAnimation.fadeInLeft
                        : AwsAnimation.fadeInUp,
                  ),
                  child: InkWell(
                    onTap: () {
                      selectedItem.value = item.value;

                      onSelected.call(item.value);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: isExpanded.value == true
                          ? Flex(
                              direction: _defaultConvertDirection(direction),
                              children: [
                                if (_defaultConvertDirection(direction) ==
                                    Axis.vertical)
                                  const SizedBox(height: 15),
                                if (_defaultConvertDirection(direction) ==
                                    Axis.horizontal)
                                  const SizedBox(width: 15),
                                CustomPaint(
                                  painter: selectedItem.value == item.value
                                      ? _paint(paint)
                                      : null,
                                  child: Icon(
                                    item.icon,
                                    color: selectedItem.value == item.value
                                        ? _defaultTheme().item.isSelectedColor
                                        : _defaultTheme().item.notSelectedColor,
                                  ),
                                ),
                                if (_defaultConvertDirection(direction) ==
                                    Axis.vertical)
                                  const SizedBox(height: 15),
                                if (_defaultConvertDirection(direction) ==
                                    Axis.horizontal)
                                  const SizedBox(width: 15),
                                Text(
                                  item.label,
                                  style: _defaultTheme()
                                      .item
                                      .labelStyle
                                      .copyWith(
                                        color: selectedItem.value == item.value
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
                              painter: selectedItem.value == item.value
                                  ? _paint(paint)
                                  : null,
                              child: Icon(
                                item.icon,
                                color: selectedItem.value == item.value
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
        if (spaceBetween) const Spacer(),
        if (!spaceBetween && direction == Axis.vertical) const Spacer(),
        if (expanded)
          AwsAniWidget(
            setting: AwsAniSetting(
              animation: direction == Axis.vertical
                  ? AwsAnimation.fadeInLeft
                  : AwsAnimation.fadeInUp,
            ),
            child: _defaultFooter(
              isExpanded: isExpanded.value,
              shift: (state) => isExpanded.value = state,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<T> selectedItem = useState(initValue);
    ValueNotifier<bool> isExpanded = useState(false);

    if (theme != null) {
      if (theme!.painter) {
        return SafeArea(
          left: safeArea,
          top: safeArea,
          right: safeArea,
          bottom: safeArea,
          child: Padding(
            padding: padding ?? EdgeInsets.all(0),
            child: _painter(context, isExpanded, selectedItem),
          ),
        );
      } else {
        return SafeArea(
          left: safeArea,
          top: safeArea,
          right: safeArea,
          bottom: safeArea,
          child: Padding(
            padding: padding ?? EdgeInsets.all(0),
            child: _material(context, isExpanded, selectedItem),
          ),
        );
      }
    } else {
      return SafeArea(
        left: safeArea,
        top: safeArea,
        right: safeArea,
        bottom: safeArea,
        child: Padding(
            padding: padding ?? EdgeInsets.all(0),
            child: _material(context, isExpanded, selectedItem)),
      );
    }
  }
}
