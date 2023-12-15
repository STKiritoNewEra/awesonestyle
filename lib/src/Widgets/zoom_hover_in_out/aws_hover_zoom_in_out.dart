import 'package:flutter/material.dart';

/// Widget that applies a zoom effect when you hover the mouse over it.
class AwsHoverZoomInOut extends StatefulWidget {
  /// Size when zoomed.
  final Size zoomIn;

  /// Size when zoomed out.
  final Size zoomOut;

  /// Animation duration.
  final Duration duration;

  /// Animation curve. If not specified, [Curves.decelerate] is used by default.
  final Curve? curve;

  /// Child widget to which the zoom effect will be applied.
  final Widget child;

  /// Callback that is called when the mouse enters or leaves the widget.
  final void Function(bool state)? hover;

  /// Constructor for [AwsHoverZoomInOut].
  const AwsHoverZoomInOut({
    Key? key,
    required this.child,
    required this.zoomIn,
    required this.zoomOut,
    required this.duration,
    this.hover,
    this.curve,
  }) : super(key: key);

  @override
  State<AwsHoverZoomInOut> createState() => _AwsHoverZoomInOutState();
}

class _AwsHoverZoomInOutState extends State<AwsHoverZoomInOut> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
        widget.hover?.call(true);
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
        widget.hover?.call(false);
      },
      child: AnimatedContainer(
        duration: widget.duration,
        width: _isHovered ? widget.zoomIn.width : widget.zoomOut.width,
        height: _isHovered ? widget.zoomIn.height : widget.zoomOut.height,
        curve: widget.curve ?? Curves.decelerate,
        child: widget.child,
      ),
    );
  }
}
