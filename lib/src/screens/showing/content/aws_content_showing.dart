import 'package:awesonestyle/src/Services/has/aws_has.dart';
import 'package:awesonestyle/src/Widgets/animations/ani_widget/link/aws_link_ani_widget.dart';
import 'package:awesonestyle/src/screens/showing/theme/aws_theme_showing.dart';
import 'package:flutter/cupertino.dart';

class AwsContentShowing extends StatelessWidget {
  /// Set the url or an asset [image].
  final String image;

  /// Sets the [title].
  final String title;

  /// Sets the [body].
  final String body;

  /// Sets the theme of [AwsContentShowing].
  final AwsThemeContentShowing? theme;

  /// Constructor of the [AwsContentShowing].
  const AwsContentShowing({
    super.key,
    required this.image,
    required this.title,
    required this.body,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Enable the animated image widget.
          if (theme?.animationImage != null)
            Expanded(
              child: AwsAniWidget(
                setting: AwsAniSetting(
                  animation: theme!.animationImage!,
                ),
                child: _image(),
              ),
            ),

          // Enable the non-animated image widget.
          if (theme?.animationImage == null) Expanded(child: _image()),
          Column(
            children: [
              if (theme?.animationTitle != null)
                AwsAniWidget(
                  setting: AwsAniSetting(
                    animation: theme!.animationTitle!,
                  ),
                  child: _title(),
                ),
              if (theme?.animationTitle == null) _title(),
              const SizedBox(
                height: 10,
              ),
              if (theme?.animationBody != null)
                AwsAniWidget(
                  setting: AwsAniSetting(
                    animation: theme!.animationBody!,
                  ),
                  child: _body(),
                ),
              if (theme?.animationBody == null) _body(),
            ],
          ),
        ],
      ),
    );
  }

  // Returns the body widget
  Text _body() {
    return Text(
      body,
      style: theme?.bodyStyle ?? const TextStyle(fontSize: 18),
      textAlign: theme?.bodyAlign ?? TextAlign.center,
    );
  }

  // Return the title widget
  Center _title() {
    return Center(
      child: Text(
        title,
        style: theme?.titleStyle ??
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        textAlign: theme?.titleAlign ?? TextAlign.center,
      ),
    );
  }

  // Returns a different widget depending on whether it is a url or an asset.
  Widget _image() {
    return AwsHas.url(image)
        ? FadeInImage.assetNetwork(
            placeholder: 'assets/loading/jar-loading.gif',
            image: image,
            fit: theme?.fitImage ?? BoxFit.contain,
          )
        : Image.asset(
            image,
            fit: theme?.fitImage ?? BoxFit.contain,
            color: theme?.colorImage,
          );
  }
}
