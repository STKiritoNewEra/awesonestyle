import 'dart:async';
import 'package:awesonestyle/src/widgets/editors/markdown/editor/aws_editor_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/format/aws_edit_format_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/preview/aws_preview_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/text/aws_text_markdown.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/type/aws_page_type_markdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markdown_core/builder.dart';

class AwsMarkdownEditor extends StatefulWidget {
  const AwsMarkdownEditor({
    Key? key,
    this.padding = const EdgeInsets.all(10),
    this.title,
    required this.content,
    this.hintTitle,
    this.hintText,
    this.onTapLink,
    this.tabChange,
    this.titleChange,
    this.contentChange,
    this.hintTitleTextStyle,
    this.hintTextStyle,
    this.appendBottomWidget,
    this.splitWidget,
    required this.imageWidget,
    this.titleFocusNode,
    this.textFocusNode,
    this.markdownFloatingMenu = true,
    this.markdownContextMenu = true,
    this.controller,
    this.formatContent,
    this.formatTitle,
    this.undoAndRedo = false,
    this.wait,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final TextEditingController? title;
  final TextEditingController content;
  final String? hintTitle;
  final String? hintText;

  //style edit
  final AwsEditFormatMD? formatContent;
  final AwsEditFormatMD? formatTitle;

  //undo and redo
  final bool undoAndRedo;

  /// see [AwsMdPreview.onTapLink]
  final TapLinkCallback? onTapLink;

  //// Enable the context menu
  final bool markdownContextMenu;

  /// Show or hide the floating menu
  final bool markdownFloatingMenu;

  /// When page change to [AwsMDPageType.preview] or [AwsMDPageType.editor]
  final AwsTabChange? tabChange;

  /// When title or text changed
  final void Function(String? data)? titleChange;
  final void Function(String? data)? contentChange;

  ///current view position
  final void Function(TabController controller)? controller;

  ///wait widget
  final Widget? wait;

  /// Change icon color, eg: color of font_bold icon.
  /* final Color? actionIconColor;

  final Color? cursorColor; */

  /*  final TextStyle? titleTextStyle;
  final TextStyle? textStyle; */
  final TextStyle? hintTitleTextStyle;
  final TextStyle? hintTextStyle;

  final Widget? appendBottomWidget;
  final Widget? splitWidget;

  final WidgetImage imageWidget;

  final FocusNode? titleFocusNode, textFocusNode;

  @override
  State<StatefulWidget> createState() => AwsMarkdownEditorWidgetState();
}

class AwsMarkdownEditorWidgetState extends State<AwsMarkdownEditor>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AwsMdEditorState> _editorKey = GlobalKey();
  late TabController _controller;
  String _previewText = '';

  /// Get edited Markdown title and text
  AwsMDText getMarkDownText() {
    return AwsMDText(_editorKey.currentState?.getTitle() ?? '',
        _editorKey.currentState?.getContent() ?? '');
  }

  /// Change current [AwsMDPageType]
  void setCurrentPage(AwsMDPageType type) {
    _controller.index = type.index;
  }

  AwsMdEditorState? getMdEditorState() {
    return _editorKey.currentState;
  }

  @override
  void initState() {
    super.initState();

    _controller =
        TabController(vsync: this, length: AwsMDPageType.values.length);
    _controller.addListener(() {
      widget.controller?.call(_controller);
      if (_controller.index == AwsMDPageType.preview.index) {
        setState(() {
          _previewText = _editorKey.currentState?.getContent() ?? '';
        });
      }
      if (widget.tabChange != null) {
        widget.tabChange!(_controller.index == AwsMDPageType.editor.index
            ? AwsMDPageType.editor
            : AwsMDPageType.preview);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _controller,
      children: <Widget>[
        SafeArea(
          child: AwsMdEditor(
            key: _editorKey,
            padding: widget.padding,
            content: widget.content,
            title: widget.title,
            hintText: widget.hintText,
            hintTitle: widget.hintTitle,
            undoAndRedo: widget.undoAndRedo,
            hintTitleStyle: widget.hintTitleTextStyle,
            hintTextStyle: widget.hintTextStyle,
            titleChange: (title) => widget.titleChange?.call(title),
            contentChange: (content) => widget.contentChange?.call(content),
            formatTitle: widget.formatTitle,
            formatContent: widget.formatContent,
            appendBottomWidget: widget.appendBottomWidget,
            splitWidget: widget.splitWidget,
            titleFocusNode: widget.titleFocusNode,
            contentFocusNode: widget.textFocusNode,
            markdownContextMenu: widget.markdownContextMenu,
            markdownFloatingMenu: widget.markdownFloatingMenu,
          ),
        ),
        SafeArea(
          child: FutureBuilder<bool>(
            future:
                Future.delayed(const Duration(milliseconds: 500), () => true),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AwsMdPreview(
                  content: _previewText,
                  padding: widget.padding,
                  onTapLink: widget.onTapLink,
                  widgetImage: widget.imageWidget,
                  textStyle: widget.formatContent?.textStyle,
                );
              }

              return Center(
                child: widget.wait ?? CupertinoActivityIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}

typedef AwsTabChange = void Function(AwsMDPageType type);
