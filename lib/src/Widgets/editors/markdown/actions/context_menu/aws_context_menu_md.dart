import 'package:awesonestyle/src/Services/screen_size/aws_screen_size.dart';
import 'package:awesonestyle/src/Widgets/editors/markdown/parser/aws_parser_md.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsContextMenuBuilderMD extends StatefulWidget {
  final EditableTextState editableTextState;
  final TextEditingController controller;

  final FocusNode editingFocusNode;
  final bool enabledHeadings;
  final bool enabledBold;
  final bool enabledItalic;
  final bool enabledLink;
  final bool enabledImage;
  final bool enabledStriketHrough;
  final bool enabledOrderedLists;
  final bool enabledUnorderedLists;
  final bool enabledQuotes;
  final bool enabledCode;
  final bool enabledHorizontalRule;
  final bool enabledSelectAll;

  /// If you want to use an alternative bold character (Default: `**`),
  /// assign a custom [String] to [boldCharacter]. For example `__`
  final String boldCharacter;

  /// If you want to use an alternative italic character (Default: `*`),
  /// assign a custom [String] to [italicCharacter]. For example `_`
  final String italicCharacter;

  /// If you want to use an alternative code character (Default: `` ``` ``),
  /// assign a custom [String] to [codeCharacter]. For example ``` ` ```
  final String codeCharacter;

  /// If you want to use an alternative bulleted list character (Default: `-`),
  /// assign a custom [String] to [bulletedListCharacter]. For example `*`
  final String bulletedListCharacter;

  /// If you want to use an alternative horizontal rule character (Default: `---`),
  /// assign a custom [String] to [horizontalRuleCharacter]. For example `***`
  final String horizontalRuleCharacter;

  const AwsContextMenuBuilderMD({
    super.key,
    required this.editableTextState,
    required this.controller,
    this.boldCharacter = '**',
    this.italicCharacter = '*',
    this.codeCharacter = '```',
    this.bulletedListCharacter = '-',
    this.horizontalRuleCharacter = '---',
    this.enabledHeadings = true,
    this.enabledBold = true,
    this.enabledItalic = true,
    this.enabledLink = true,
    this.enabledImage = true,
    this.enabledStriketHrough = true,
    this.enabledOrderedLists = true,
    this.enabledUnorderedLists = true,
    this.enabledQuotes = true,
    this.enabledHorizontalRule = true,
    this.enabledCode = false,
    this.enabledSelectAll = false,
    required this.editingFocusNode,
  });

  @override
  State<AwsContextMenuBuilderMD> createState() =>
      _AwsContextMenuBuilderMDState();
}

class _AwsContextMenuBuilderMDState extends State<AwsContextMenuBuilderMD> {
  late List<ContextMenuButtonItem>? buttonItems;

  @override
  void initState() {
    buttonItems = [];
    addOption();

    super.initState();
  }

  _headingsOptions() {
    buttonItems!.insert(
        0,
        ContextMenuButtonItem(
          label: 'Headings',
          onPressed: () {
            ContextMenuController.removeAny();
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return Material(
                    type: MaterialType.transparency,
                    child: Container(
                      height: context.height(7),
                      width: context.width(80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            PopupMenuItem(
                              child: const Text(
                                'H1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35),
                              ),
                              onTap: () => _onHeadingPressed(0),
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'H2',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              onTap: () => _onHeadingPressed(1),
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'H3',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              onTap: () => _onHeadingPressed(2),
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'H4',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              onTap: () => _onHeadingPressed(3),
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'H5',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              onTap: () => _onHeadingPressed(4),
                            ),
                            PopupMenuItem(
                              child: const Text(
                                'H6',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                              onTap: () => _onHeadingPressed(5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }

  _boldOption() {
    buttonItems!.add(ContextMenuButtonItem(
      label: 'Bold',
      onPressed: () {
        ContextMenuController.removeAny();
        _onBoldPressed();
      },
    ));
  }

  _italicOption() {
    buttonItems!.add(ContextMenuButtonItem(
      label: 'Italic',
      onPressed: () {
        ContextMenuController.removeAny();
        _onItalicPressed();
      },
    ));
  }

  _linkOption() {
    buttonItems!.add(ContextMenuButtonItem(
      label: 'link',
      onPressed: () {
        ContextMenuController.removeAny();
        _onLinkPressed();
      },
    ));
  }

  _imageOption() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'image',
        onPressed: () {
          ContextMenuController.removeAny();
          _onImagePressed();
        },
      ),
    );
  }

  _striketHrough() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Tachar',
        onPressed: () {
          ContextMenuController.removeAny();
          _onStrikethroughPressed();
        },
      ),
    );
  }

  _orderedLists() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'listas ordenadas',
        onPressed: () {
          ContextMenuController.removeAny();
          _onOrderedListPressed();
        },
      ),
    );
  }

  _unorderedLists() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'listas no ordenadas',
        onPressed: () {
          ContextMenuController.removeAny();
          _onUnorderedListPressed();
        },
      ),
    );
  }

  _quotes() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Citar',
        onPressed: () {
          ContextMenuController.removeAny();
          _onQuotePressed();
        },
      ),
    );
  }

  _horizontalRule() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Horiz.Rule',
        onPressed: () {
          ContextMenuController.removeAny();
          _onHorizontalRulePressed();
        },
      ),
    );
  }

  _code() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Code',
        onPressed: () {
          ContextMenuController.removeAny();
          _onCodePressed();
        },
      ),
    );
  }

  _basicOption() {
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Copiar',
        type: ContextMenuButtonType.copy,
        onPressed: () {
          ContextMenuController.removeAny();
          _onCopyPressed();
        },
      ),
    );
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Cortar',
        type: ContextMenuButtonType.cut,
        onPressed: () {
          ContextMenuController.removeAny();
          _onCutPressed();
        },
      ),
    );
    buttonItems!.add(
      ContextMenuButtonItem(
        label: 'Pegar',
        type: ContextMenuButtonType.paste,
        onPressed: () {
          ContextMenuController.removeAny();
          _onPastePressed();
        },
      ),
    );
    if (widget.enabledSelectAll) {
      buttonItems!.add(
        ContextMenuButtonItem(
          label: 'Seleccionar todo',
          type: ContextMenuButtonType.paste,
          onPressed: () {
            ContextMenuController.removeAny();
            _onSelectAllPressed();
          },
        ),
      );
    }
  }

  addOption() {
    if (buttonItems != null) {
      if (widget.enabledHeadings) {
        _headingsOptions();
      }
      if (widget.enabledBold) {
        _boldOption();
      }
      if (widget.enabledItalic) {
        _italicOption();
      }
      if (widget.enabledStriketHrough) {
        _striketHrough();
      }
      if (widget.enabledLink) {
        _linkOption();
      }
      if (widget.enabledImage) {
        _imageOption();
      }
      if (widget.enabledOrderedLists) {
        _orderedLists();
      }
      if (widget.enabledUnorderedLists) {
        _unorderedLists();
      }
      if (widget.enabledQuotes) {
        _quotes();
      }
      if (widget.enabledCode) {
        _code();
      }
      if (widget.enabledHorizontalRule) {
        _horizontalRule();
      }
      _basicOption();
    }
  }

  void _onHeadingPressed(int option) => _onOptionPressed(
      option: option, markdownToolbarOption: AwsMarkdownMenuOption.heading);

  void _onBoldPressed() =>
      _onOptionPressed(markdownToolbarOption: AwsMarkdownMenuOption.bold);

  void _onItalicPressed() =>
      _onOptionPressed(markdownToolbarOption: AwsMarkdownMenuOption.italic);

  void _onStrikethroughPressed() => _onOptionPressed(
      markdownToolbarOption: AwsMarkdownMenuOption.strikethrough);

  void _onLinkPressed() =>
      _onOptionPressed(markdownToolbarOption: AwsMarkdownMenuOption.link);

  void _onImagePressed() =>
      _onOptionPressed(markdownToolbarOption: AwsMarkdownMenuOption.image);

  void _onCodePressed() =>
      _onOptionPressed(markdownToolbarOption: AwsMarkdownMenuOption.code);

  void _onUnorderedListPressed() => _onOptionPressed(
      markdownToolbarOption: AwsMarkdownMenuOption.unorderedList);

  void _onOrderedListPressed() => _onOptionPressed(
      markdownToolbarOption: AwsMarkdownMenuOption.orderedList);

  void _onQuotePressed() =>
      _onOptionPressed(markdownToolbarOption: AwsMarkdownMenuOption.quote);

  void _onHorizontalRulePressed() => _onOptionPressed(
      markdownToolbarOption: AwsMarkdownMenuOption.horizontalRule);

  void _onOptionPressed({
    required AwsMarkdownMenuOption markdownToolbarOption,
    int? option,
  }) {
    AwsFormatMD.toolbarItemPressed(
      markdownToolbarOption: markdownToolbarOption,
      controller: widget.controller,
      selection: widget.controller.selection,
      option: option,
      customBoldCharacter: widget.boldCharacter,
      customItalicCharacter: widget.italicCharacter,
      customCodeCharacter: widget.codeCharacter,
      customBulletedListCharacter: widget.bulletedListCharacter,
      customHorizontalRuleCharacter: widget.horizontalRuleCharacter,
    );
  }

  void _onCopyPressed() {
    widget.editableTextState.copySelection(SelectionChangedCause.toolbar);
  }

  void _onCutPressed() {
    widget.editableTextState.cutSelection(SelectionChangedCause.toolbar);
  }

  void _onPastePressed() {
    widget.editableTextState.pasteText(SelectionChangedCause.toolbar);
  }

  void _onSelectAllPressed() {
    widget.editableTextState.selectAll(SelectionChangedCause.toolbar);
  }

  @override
  void dispose() {
    buttonItems = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: widget.editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  }
}
