import 'package:flutter/material.dart';
import 'package:markdown_core/builder.dart';
import 'package:markdown_core/markdown.dart';

class AwsMdPreview extends StatefulWidget {
  const AwsMdPreview({
    Key? key,
    required this.content,
    this.padding = const EdgeInsets.all(0.0),
    this.onTapLink,
    required this.widgetImage,
    this.textStyle,
  }) : super(key: key);

  final String content;
  final EdgeInsetsGeometry padding;
  final WidgetImage widgetImage;
  final TextStyle? textStyle;

  /// Call this method when it tap link of markdown.
  /// If [onTapLink] is null,it will open the link with your default browser.
  final TapLinkCallback? onTapLink;

  @override
  State<StatefulWidget> createState() => AwsMdPreviewState();
}

class AwsMdPreviewState extends State<AwsMdPreview>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: widget.padding,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Markdown(
              data: widget.content,
              maxWidth: constraints.maxWidth,
              linkTap: (link) {
                debugPrint(link);
                if (widget.onTapLink != null) {
                  widget.onTapLink!(link);
                }
              },
              image: widget.widgetImage,
              textStyle: widget.textStyle,
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

typedef void TapLinkCallback(String link);
