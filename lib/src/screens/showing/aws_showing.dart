import 'package:awesonestyle/src/services/services_link.dart';
import 'package:awesonestyle/src/widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:awesonestyle/src/screens/showing/button/aws_text_button_showing.dart';
import 'package:awesonestyle/src/screens/showing/content/aws_content_showing.dart';
import 'package:awesonestyle/src/screens/showing/indicator/aws_indicator_showing.dart';
import 'package:awesonestyle/src/screens/showing/theme/aws_theme_showing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwsShowingScreen extends StatefulWidget {
  /// [initial] is the initial content to be displayed from [contents].
  final int initial;

  /// With [AwsThemeShowing] you can set the theme you want [AwsShowingScreen] to have.
  /// You can set a background color with [Color],
  /// the theme of the indicators with [AwsThemeIndicatorShowing],
  /// the theme of the next button with [AwsThemeNextButtonShowing()],
  /// the theme of the content with [AwsThemeContentShowing].
  ///
  /// You can also set animations with [AwsAnimation].
  final AwsThemeShowing? theme;

  /// [leading] is actually a button that is arranged in the upper right hand corner.
  ///
  /// Remember that if you set [leading] you must also set [finishLeading].
  final AwsTextButtonShowing? leading;

  /// [contents] is used to set the content to be displayed.
  final List<AwsContentShowing> contents;

  /// [trailing] is a button that is currently at the bottom and is displayed when the last content is reached.
  final AwsTextButtonShowing trailing;

  /// [finishLeading] is the leading that is displayed when the last content is reached.
  final AwsTextButtonShowing? finishLeading;

  /// [AwsShowingScreen] is a screen that is used to make a presentation of the app even though it can be used as needed.
  const AwsShowingScreen({
    super.key,
    this.initial = 0,
    this.theme,
    this.leading,
    required this.contents,
    required this.trailing,
    this.finishLeading,
  });

  @override
  State<AwsShowingScreen> createState() => _AwsShowingScreenState();
}

class _AwsShowingScreenState extends State<AwsShowingScreen>
    with TickerProviderStateMixin {
  // [_indicators] is the number of indicators that the candida of [contents] set represents.
  final List<Widget> _indicators = [];

  // [_controllerPage] is a controller that is responsible for navigating between the different [contents].
  PageController? _controllerPage;
  // [_positionMaxContent] is the maximum position available in [contents].
  late double _positionMaxContent;
  // [_positionCurrentContent] is the current position of [contents].
  late double _positionCurrentContent;
  // [_theme] defaults to a theme already set if no [theme] is given.
  late AwsThemeShowing _theme;
  // [_contents] sets what comes in [contents].
  late List<AwsContentShowing> _contents;
  // blocks [_onNextButton()] from being duplicated.
  bool _activeStateNextButton = false;

  // sets [_contents] from [contents],
  // when it detects that the [theme] was set individually, it is set but when the global [theme] is not set.
  _generateContents() {
    _contents = widget.contents.map((i) {
      if (_theme.content != null) {
        return AwsContentShowing(
          image: i.image,
          title: i.title,
          body: i.body,
          theme: _theme.content!,
        );
      } else {
        return AwsContentShowing(
          image: i.image,
          title: i.title,
          body: i.body,
          theme: i.theme,
        );
      }
    }).toList();
  }

  // sets the number of indicators to the same number of [contents].
  _generateIndicator() {
    int length = widget.contents.length;
    _indicators.clear();
    _indicators.addAll(
      List<Widget>.generate(
        length,
        (index) => AwsAniWidget(
          setting: AwsAniSetting(
            animation: _theme.indicator.initStateAnimation,
            animate: true,
          ),
          child: AwsIndicatorShowing(
            color: _theme.indicator.initStatecolor,
            height: _theme.indicator.height,
            width: _theme.indicator.width,
            margin: _theme.indicator.margin,
            border: _theme.indicator.border,
            borderColor: _theme.indicator.borderColor,
            shadow: _theme.indicator.shadow,
            gradient: _theme.indicator.initStateGradient,
          ),
        ),
      ),
    );
  }

  // Check if the last content is found
  Future<bool> _checkPositionFinish() async {
    if (_positionCurrentContent < _positionMaxContent - 1) {
      return Future(() => false);
    }
    return Future.delayed(const Duration(milliseconds: 1000), () {
      return _positionCurrentContent == _positionMaxContent - 1;
    });
  }

  // Execute the next content to display
  _onNextButton() {
    if (_positionCurrentContent == _positionMaxContent - 1) {
      _activeStateNextButton = true;
    } else {
      _activeStateNextButton = true;
      _controllerPage?.addListener(() async {
        await Future.delayed(const Duration(milliseconds: 1));
        _positionCurrentContent = _controllerPage!.page!;
        _seletedIndicator(_controllerPage!.page!.toInt());
      });
      _controllerPage?.nextPage(
          duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
      _activeStateNextButton = false;
    }
  }

  // It is the widget that is shown at the bottom, the indicators if the last content was not reached, the [trailing] is shown if the end is reached.
  Widget _trailingWidget() {
    return FutureBuilder<bool>(
      future: _checkPositionFinish(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: widget.trailing,
            );
          }
        }
        return SizedBox(
          height: context.height(10),
          width: context.width(100),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _indicators,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Theme(
                  data: ThemeData(
                    useMaterial3: _theme.nextButton.useMaterial3 ?? true,
                    colorSchemeSeed: _theme.nextButton.backgroundColor,
                  ),
                  child: AwsAniWidget(
                    setting: AwsAniSetting(
                      animation: _theme.nextButton.iniStateAnimation,
                    ),
                    child: FloatingActionButton(
                      onPressed:
                          _activeStateNextButton ? null : () => _onNextButton(),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: _theme.nextButton.arrowColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //Activates the indicator at the current position.
  _seletedIndicator(int index) {
    setState(() {
      _generateIndicator();
      _indicators.removeAt(index);

      _indicators.insert(
          index,
          AwsAniWidget(
            setting: AwsAniSetting(
              animation: _theme.indicator.changeStateAnimation,
              controller: (c) {
                c.forward();
              },
              manualTrigger: true,
            ),
            child: AwsIndicatorShowing(
              color: _theme.indicator.changeStatecolor,
              height: _theme.indicator.height,
              width: _theme.indicator.width,
              margin: _theme.indicator.margin,
              border: _theme.indicator.border,
              borderColor: _theme.indicator.borderColor,
              shadow: _theme.indicator.shadow,
              gradient: _theme.indicator.changeStateGradient,
            ),
          ));
    });
  }

  //set the initial state
  @override
  void initState() {
    if (widget.leading != null && widget.finishLeading == null) {
      throw 'If [leading] is different from null, [finishLeading] must also be different from null';
    }
    if (widget.contents.isEmpty) {
      throw '[childrens] must not be empty';
    } else {
      _theme = widget.theme ??
          AwsThemeShowing(
            backgroundColor: CupertinoColors.white,
            indicator: AwsThemeIndicatorShowing(),
            nextButton: AwsThemeNextButtonShowing(
              backgroundColor: CupertinoColors.activeBlue,
            ),
          );
      _generateContents();
      _positionMaxContent = widget.contents.length.toDouble();
      _positionCurrentContent = widget.initial.toDouble();
      _generateIndicator();
      _controllerPage = PageController(initialPage: widget.initial);

      _seletedIndicator(0);
      _controllerPage?.addListener(() {
        _positionCurrentContent = _controllerPage!.page!;
        _seletedIndicator(_controllerPage!.page!.toInt());
      });
    }
    super.initState();
  }

  // is the widget displayed on top, has a container just in case, displays the [leading] if I don't get to the end, otherwise displays [finishLeading].
  Widget _leadingWidget() {
    return FutureBuilder<bool>(
      future: _checkPositionFinish(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return widget.finishLeading ?? Container();
          }
        }
        return widget.leading ?? Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.theme?.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            //[leading and finishLeading]
            if (widget.leading != null && widget.finishLeading != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_leadingWidget()],
              ),
            //[contents] view
            Expanded(
              child: PageView(controller: _controllerPage, children: _contents),
            ),
            //[trailing]
            _trailingWidget(),
          ],
        ),
      ),
    );
  }
}
