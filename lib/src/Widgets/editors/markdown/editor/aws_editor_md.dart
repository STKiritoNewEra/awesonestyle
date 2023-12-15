import 'package:awesonestyle/src/services/services_link.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/actions/context_menu/aws_context_menu_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/actions/floating_menu/aws_floating_menu_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/format/aws_edit_format_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/perform/aws_editor_perform_md.dart';
import 'package:awesonestyle/src/widgets/editors/markdown/physics/aws_physics_md.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AwsMdEditor extends StatefulWidget {
  const AwsMdEditor({
    Key? key,
    this.padding = const EdgeInsets.all(0.0),
    required this.title,
    required this.content,
    this.hintTitle,
    this.hintTitleStyle,
    this.hintText,
    this.hintTextStyle,
    this.titleChange,
    this.contentChange,
    this.appendBottomWidget,
    this.splitWidget,
    this.titleFocusNode,
    this.contentFocusNode,
    this.markdownFloatingMenu = true,
    this.markdownContextMenu = true,
    this.formatContent,
    this.formatTitle,
    this.undoAndRedo = false,
  }) : super(key: key);

  final TextStyle? hintTitleStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry padding;
  final TextEditingController? title;
  final TextEditingController content;
  final String? hintTitle;
  final String? hintText;

  //undo and redo
  final bool undoAndRedo;

  //style edit
  final AwsEditFormatMD? formatContent;
  final AwsEditFormatMD? formatTitle;

  /// Editor in content and title mode or only content
  //final bool enableTitle;

  /// Enable the context menu
  final bool markdownContextMenu;

  /// Show or hide the floating menu
  final bool markdownFloatingMenu;

  final void Function(String? data)? titleChange;
  final void Function(String? data)? contentChange;

  /// Change icon color, eg: color of font_bold icon.
  /*  final Color? actionIconColor; */

  /* final Color? cursorColor; */

  final Widget? appendBottomWidget;

  final Widget? splitWidget;

  final FocusNode? titleFocusNode, contentFocusNode;

  @override
  State<StatefulWidget> createState() => AwsMdEditorState();
}

class AwsMdEditorState extends State<AwsMdEditor>
    with AutomaticKeepAliveClientMixin {
  final FocusNode defaultContentFocusNode = FocusNode();
  // ignore: prefer_typing_uninitialized_variables
  late AwsEditPerformMD _editPerform;
  /* GetStorage? _pres;
 */
  String? getTitle() {
    return widget.title?.value.text;
  }

  String getContent() {
    return widget.content.value.text;
  }

  // Mover el cursor del cuadro de texto hasta el final
  void moveTextCursorToEnd() {
    final str = widget.content.text;
    widget.content.value = TextEditingValue(
        text: str, selection: TextSelection.collapsed(offset: str.length));
  }

  @override
  void initState() {
    super.initState();

    _editPerform = AwsEditPerformMD(
      widget.content,
      initContent: widget.content.text,
    );
  }

  Widget _textTMedit() {
    return TextField(
      maxLines: 1,
      cursorColor: widget.formatTitle?.cursorColor,
      cursorWidth: widget.formatTitle?.cursorWidth ?? 1.5,
      controller: widget.title,
      focusNode: widget.titleFocusNode,
      keyboardType: TextInputType.text,
      onChanged: (text) {
        if (widget.titleChange != null) {
          widget.titleChange?.call(text);
        }
      },
      style: widget.formatTitle?.textStyle ??
          const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF333333),
          ),
      decoration: InputDecoration(
        hintText: widget.hintTitle ?? 'Title',
        border: InputBorder.none,
        hintStyle: widget.hintTitleStyle,
      ),
    );
  }

  Widget _textCMEdit() {
    return CupertinoTextField(
      maxLines: null,

      expands: true,
      //
      cursorColor: widget.formatContent?.cursorColor,
      keyboardType:
          widget.formatContent?.keyboardType ?? TextInputType.multiline,
      textAlign: TextAlign.justify,

      strutStyle: widget.formatContent?.strutStyle,
      textAlignVertical:
          widget.formatContent?.textAlignVertical ?? TextAlignVertical.bottom,
      autocorrect: widget.formatContent?.autocorrect ?? true,
      smartQuotesType:
          widget.formatContent?.smartQuotesType ?? SmartQuotesType.enabled,
      smartDashesType:
          widget.formatContent?.smartDashesType ?? SmartDashesType.enabled,
      cursorWidth: widget.formatContent?.cursorWidth ?? 1.5,
      style: widget.formatContent?.textStyle ??
          const TextStyle(
            fontSize: 17,
            height: kIsWeb ? null : 1.3,
          ),
      //
      controller: widget.content,
      focusNode: widget.contentFocusNode ?? defaultContentFocusNode,

      placeholder: 'Escriba aqui...',
      decoration: const BoxDecoration(),
      textInputAction: TextInputAction.newline,

      scrollPhysics: const AwsCustomizePhysicsMD(),

      onChanged: (text) {
        _editPerform.change(text);
        if (widget.contentChange != null) {
          widget.contentChange?.call(text);
        }
      },

      /* decoration: InputDecoration(
        hintText: widget.hintText ?? '请输入内容',
        border: InputBorder.none,
        hintStyle: widget.hintTextStyle,
      ), */
      contextMenuBuilder: (context, editableTextState) {
        if (!widget.markdownContextMenu) {
          return AdaptiveTextSelectionToolbar.buttonItems(
            anchors: editableTextState.contextMenuAnchors,
            buttonItems: editableTextState.contextMenuButtonItems,
          );
        }

        return AwsContextMenuBuilderMD(
          editableTextState: editableTextState,
          controller: widget.content,
          editingFocusNode: widget.contentFocusNode ?? defaultContentFocusNode,
        );
      },
    );
  }

  Widget _contentEdit() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        _textCMEdit(),
        widget.appendBottomWidget ?? const SizedBox(),
      ],
    );
  }

  Widget _titleAndContentEdit() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        _textTMedit(),
        widget.splitWidget ??
            Container(
              height: 1.0,
              decoration: const BoxDecoration(
                color: Color(0xFFDDDDDD),
              ),
            ),
        _textCMEdit(),
        widget.appendBottomWidget ?? const SizedBox(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      height: context.height(100),
      width: context.width(100),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (widget.contentFocusNode != null) {
                  widget.contentFocusNode!.requestFocus();
                } else {
                  defaultContentFocusNode.requestFocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Padding(
                  padding: widget.padding,
                  child: widget.title!=null
                      ? _titleAndContentEdit()
                      : _contentEdit(),
                ),
              ),
            ),
          ),
          if (widget.undoAndRedo)
            Positioned(
              bottom: 5,
              left: 5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    child: const Icon(Icons.undo),
                    onPressed: () {
                      _editPerform.undo();
                    },
                  ),
                  CupertinoButton(
                    child: const Icon(Icons.redo),
                    onPressed: () {
                      _editPerform.redo();
                    },
                  ),
                ],
              ),
            ),
          if (widget.markdownFloatingMenu)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomRight,
                child: AwsMarkdownFloatingMenu(
                  useIncludedTextField: false,
                  controller: widget.content,
                  alignCollapseButtonEnd: true,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
