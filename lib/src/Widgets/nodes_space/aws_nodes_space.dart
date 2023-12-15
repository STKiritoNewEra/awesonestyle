import 'package:flutter/material.dart';
import 'package:awesonestyle/awesonestyle.dart';

/// Abstract class that represents a node within the node space of [AwsNodesSpace].
abstract class AwsNodeElementNodesSpace {
  /// [id]: Unique identifier for the node.
  final String id;

  /// [node]: Widget that represents the content of the node.
  final Widget node;

  /// [offset]: Position of the node in space.
  Offset offset;

  /// [connector]: Connector that associates the node with its parent node.
  final AwsNodeConnectorNodesSpace? connector;

  /// [connectedNodes]: List of nodes connected to this node.
  final List<AwsNodeElementNodesSpace>? connectedNodes;

  /// Constructor de la clase [AwsNodeElementNodesSpace].
  ///
  /// [id]: Unique identifier for the node.
  ///
  /// [node]: Widget that represents the content of the node.
  ///
  /// [offset]: Position of the node in space.
  ///
  /// [connector]: Connector that associates the node with its parent node.
  ///
  /// [connectedNodes]: List of nodes connected to this node.

  AwsNodeElementNodesSpace({
    required this.id,
    required this.node,
    required this.offset,
    this.connector,
    this.connectedNodes,
  });
}

/// Class that represents a standard node within the node space of [AwsNodesSpace].
class AwsNodeStandardNodesSpace extends AwsNodeElementNodesSpace {
  /// [width]: Width of the standard node.
  final double width;

  /// [height]: Height of the standard node.
  final double height;

  /// Constructor of class [AwsNodeStandardNodesSpace].
  ///
  /// [id]: Unique identifier for the node.
  ///
  /// [node]: Widget that represents the content of the node.
  ///
  /// [offset]: Position of the node in space.
  ///
  /// [connectedNodes]: List of nodes connected to this node.
  ///
  /// [connector]: Connector that associates the node with its parent node.
  ///
  /// [width]: Standard node width.
  ///
  /// [height]: Standard node height.

  AwsNodeStandardNodesSpace({
    required super.id,
    required super.node,
    required super.offset,
    super.connectedNodes,
    super.connector,
    required this.width,
    required this.height,
  });
}

/// Class that represents a zoomable node within the node space of [AwsNodesSpace].
class AwsNodeZoomInOutNodesSpace extends AwsNodeElementNodesSpace {
  /// Node size when zoomed in.
  final Size zoomIn;

  /// Node size when zoomed out.
  final Size zoomOut;

  /// Zoom animation duration.
  final Duration duration;

  /// Animation curve used for zooming.
  final Curve? curve;

  /// Callback function that handles the 'hover' event (on or off the node).
  final void Function(bool state)? hover;

  /// Constructor of class [AwsNodeZoomInOutNodesSpace].
  ///
  /// [id]: Unique identifier for the node.
  ///
  /// [node]: Widget that represents the content of the node.
  ///
  /// [offset]: Position of the node in space.
  ///
  /// [connectedNodes]: List of nodes connected to this node.
  ///
  /// [connector]: Connector that associates the node with its parent node.
  ///
  /// [zoomIn]: Node size when hover is active.
  ///
  /// [zoomOut]: Node size when hover is inactive.
  ///
  /// [duration]: Duración de la animación de zoom.
  ///
  /// [curve]: Animation curve used for zooming.
  ///
  /// [hover]: Callback function that handles the 'hover' event (on or off the node).

  AwsNodeZoomInOutNodesSpace({
    required super.id,
    required super.node,
    required super.offset,
    super.connectedNodes,
    super.connector,
    required this.zoomIn,
    required this.zoomOut,
    required this.duration,
    this.curve,
    this.hover,
  });
}

/// Class that represents a node with the ability to increase its size in the node space of [AwsNodesSpace].
class AwsNodeSizeNodesSpace extends AwsNodeElementNodesSpace {
  /// Initial width of the node.
  final double width;

  /// Initial height of the node.
  final double height;

  /// Decimal percentage increase in size applied to the node.
  final double increment;

  /// Animation curve used for resizing.
  final Curve curve;

  /// Duration of the resizing animation.
  final Duration duration;

  /// Reverse animation duration (optional) for resizing.
  final Duration? reverseDuration;

  /// Constructor of class [AwsNodeSizeNodesSpace].
  ///
  /// [id]: Unique identifier for the node.
  ///
  /// [width]: Initial width of the node.
  ///
  /// [height]: Initial height of the node.
  ///
  /// [increment]: Size increment applied to the node.
  ///
  /// [node]: Widget that represents the content of the node.
  ///
  /// [offset]: Position of the node in space.
  ///
  /// [curve]: Animation curve used for resizing. By default, it is a linear curve.
  ///
  /// [duration]: Duration of the resizing animation.
  ///
  /// [reverseDuration]: Reverse animation duration (optional) for resizing.
  ///
  /// [connector]: Connector that associates the node with its parent node.
  ///
  /// [connectedNodes]: List of nodes connected to this node.

  AwsNodeSizeNodesSpace({
    required super.id,
    required this.width,
    required this.height,
    required this.increment,
    required super.node,
    required super.offset,
    this.curve = Curves.linear,
    required this.duration,
    this.reverseDuration,
    super.connector,
    super.connectedNodes,
  });
}

/// Class that represents an animated node within the node space of [AwsNodesSpace].
class AwsNodeAnimatedNodesSpace extends AwsNodeElementNodesSpace {
  /// Width of the animated node.
  final double width;

  /// Height of the animated node.
  final double height;

  /// Setting the node animation.
  final AwsAniSetting setting;

  /// Constructor of class [AwsNodeAnimatedNodesSpace].
  ///
  /// [id]: Unique identifier for the node.
  ///
  /// [node]: Widget that represents the content of the node.
  ///
  /// [offset]: Position of the node in space.
  ///
  /// [connectedNodes]: List of nodes connected to this node.
  ///
  /// [width]: Width of the animated node.
  ///
  /// [height]: Height of the animated node.
  ///
  /// [setting]: Node animation settings.
  ///
  /// [connector]: Connector that associates the node with its parent node.

  AwsNodeAnimatedNodesSpace({
    required super.id,
    required super.node,
    required super.offset,
    super.connectedNodes,
    required this.width,
    required this.height,
    required this.setting,
    super.connector,
  });
}

/// Class that represents a node with animations based on the 'hover' event within the node space of [AwsNodesSpace].
class AwsNodeHoverAnimatedNodesSpace extends AwsNodeElementNodesSpace {
  /// Width of the node.
  final double width;

  /// Height of the node.
  final double height;

  /// Decoration of the node when it is not in the 'hover' state.
  final BoxDecoration notHover;

  /// Decoration of the node when it is in the 'hover' state.
  final BoxDecoration isHover;

  /// Animation applied to the node.
  final AwsAnimation animation;

  /// Animation duration (optional).
  final Duration? duration;

  /// Constructor of class [AwsNodeHoverAnimatedNodesSpace].
  ///
  /// [id]: Unique identifier for the node.
  ///
  /// [node]: Widget that represents the content of the node.
  ///
  /// [offset]: Position of the node in space.
  ///
  /// [connectedNodes]: List of nodes connected to this node.
  ///
  /// [width]: Width of the node.
  ///
  /// [height]: Height of the node.
  ///
  /// [notHover]: Decoration of the node when it is not in the 'hover' state.
  ///
  /// [isHover]: Decoration of the node when it is in the 'hover' state.
  ///
  /// [animation]: Animation applied to the node.
  ///
  /// [duration]: Duration of the animation (optional).
  ///
  /// [connector]: Connector that associates the node with its parent node.

  AwsNodeHoverAnimatedNodesSpace({
    required super.id,
    required super.node,
    required super.offset,
    super.connectedNodes,
    required this.width,
    required this.height,
    required this.animation,
    required this.duration,
    required this.notHover,
    required this.isHover,
    super.connector,
  });
}

/// Widget that represents a node space
class AwsNodesSpace extends StatelessWidget {
  /// Main node that will be displayed in this space.
  final AwsNodeElementNodesSpace node;

  /// Function used to update the position of a node.
  /// use the AwsNodesSpace.updateOffsetsRecursively() method, to update the position of a node if you don't want to do it yourself.
  final Function(String, Offset) updateNode;

  /// Global connector that will be used to connect nodes in space.
  final AwsNodeConnectorNodesSpace connector;

  /// Global animation settings for the node space (optional).
  final AwsAniSetting? animation;

  ///Minimum scala in which the node space will be displayed.
  final double minScale;

  ///Maximum scala in which the node space will be displayed.
  final double maxScale;

  /// Constructor of class [AwsNodesSpace].
  ///
  /// [node]: Main node that will be displayed in the space.
  ///
  /// [updateNode]: Function used to update the position of a node.
  ///
  /// [connector]: Global connector that will be used to connect nodes in space.
  ///
  /// [animation]: Global animation settings for the node space (optional).

  const AwsNodesSpace({
    Key? key,
    required this.connector,
    required this.node,
    required this.updateNode,
    this.animation,
    this.minScale = 0.1,
    this.maxScale = 100.0,
  }) : super(key: key);

  //Static and private method that updates the position of the nodes connected to the parent node.
  static void _updateOffsetsConnectedNode(
      {required AwsNodeElementNodesSpace connectedNodes,
      required String id,
      required Offset offset}) {
    if (connectedNodes.connectedNodes != null) {
      for (var nodes in connectedNodes.connectedNodes!) {
        _updateOffsetsConnectedNode(
            connectedNodes: nodes, id: id, offset: offset);
        if (nodes.id == id) {
          nodes.offset = offset;
        }
      }
    }
  }

  //Static method that updates the position of the parent nodes and the nodes connected to it.
  static void updateOffsetsRecursively(
      {required AwsNodeElementNodesSpace node,
      required String id,
      required Offset offset}) {
    if (node.id == id) {
      node.offset = offset;
    }
    _updateOffsetsConnectedNode(connectedNodes: node, id: id, offset: offset);
  }

  //Adds a node to the node space depending on whether it is a parent node or a node connected to a parent node.
  List<Widget> _buildNodeWidgets(AwsNodeElementNodesSpace parentNode) {
    List<Widget> widgets = [];
    //Add the parent node to the node space
    if (parentNode is AwsNodeStandardNodesSpace) {
      widgets.add(standard(parentNode));
    } else if (parentNode is AwsNodeZoomInOutNodesSpace) {
      widgets.add(zoomInOut(parentNode));
    } else if (parentNode is AwsNodeSizeNodesSpace) {
      widgets.add(size(parentNode));
    } else if (parentNode is AwsNodeAnimatedNodesSpace) {
      widgets.add(animated(parentNode));
    } else if (parentNode is AwsNodeHoverAnimatedNodesSpace) {
      widgets.add(hoverAnimated(parentNode));
    }

    //Add the connected node to a parent node.
    if (parentNode.connectedNodes != null) {
      for (var connectedNode in parentNode.connectedNodes!) {
        if (connectedNode is AwsNodeStandardNodesSpace) {
          widgets.addAll(_buildNodeWidgets(connectedNode));
          widgets.add(standard(connectedNode));
        } else if (connectedNode is AwsNodeZoomInOutNodesSpace) {
          widgets.addAll(_buildNodeWidgets(connectedNode));
          widgets.add(zoomInOut(connectedNode));
        } else if (connectedNode is AwsNodeSizeNodesSpace) {
          widgets.addAll(_buildNodeWidgets(connectedNode));
          widgets.add(size(connectedNode));
        } else if (connectedNode is AwsNodeAnimatedNodesSpace) {
          widgets.addAll(_buildNodeWidgets(connectedNode));
          widgets.add(animated(connectedNode));
        } else if (connectedNode is AwsNodeHoverAnimatedNodesSpace) {
          widgets.addAll(_buildNodeWidgets(connectedNode));
          widgets.add(hoverAnimated(connectedNode));
        }
      }
    }

    return widgets;
  }

  /// [hoverAnimated]
  /// Positions a hover node of type [AwsNodeHoverAnimatedNodesSpace].
  ///
  /// This function takes a [node] of type [AwsNodeHoverAnimatedNodesSpace] and places it in a
  /// specific position on the screen. Calculates the position based on the provided offset
  /// on the [node], the width and height. Returns a Positioned widget containing the [node]
  /// Correctly positioned with the hover animation effect.
  Positioned hoverAnimated(AwsNodeHoverAnimatedNodesSpace node) {
    return Positioned(
      left: node.offset.dx - (node.width / 2),
      top: node.offset.dy - (node.height / 2),
      child: Draggable(
        feedback: Container(),
        child: _AwsDetectorHoverAnimatedMoveNodesSpace(
          // This method updates the position of the node when it moves.
          onChanged: (Offset offset) => updateNode(node.id, offset),
          node: node,
        ),
      ),
    );
  }

  /// Positions an [AwsNodeSizeNodesSpace] node by adjusting its [size].
  ///
  /// This function takes a [node] of type [AwsNodeSizeNodesSpace] and places it in a
  /// specific position on the screen. Calculates the position based on the provided [offset]
  /// on the [node], the width and height. Returns a [Positioned] widget containing the [node]
  /// correctly positioned and adjusted in [size].
  Positioned size(AwsNodeSizeNodesSpace node) {
    return Positioned(
      left: node.offset.dx - (node.width / 2),
      top: node.offset.dy - (node.height / 2),
      child: Draggable(
        feedback: Container(),
        child: _AwsDetectorSizeMoveNodesSpace(
          // This method updates the position of the node when it moves.
          onChanged: (Offset offset) => updateNode(node.id, offset),
          node: node,
        ),
      ),
    );
  }

  ///[zoomInOut]
  /// Positions a node with a zoom effect of type [AwsNodeZoomInOutNodesSpace].
  ///
  /// This function takes a [node] of type [AwsNodeZoomInOutNodesSpace] and places it
  /// at a specific position on the screen. Calculates the position based on the
  /// [offset] provided in the node and the dimensions of the zoomIn and zoomOut effect.
  /// Returns a [Positioned] widget containing the [node] with the zoom effect correctly positioned.
  Positioned zoomInOut(AwsNodeZoomInOutNodesSpace node) {
    return Positioned(
      left: node.offset.dx - (node.zoomOut.width / 2),
      top: node.offset.dy - (node.zoomOut.height / 2),
      child: Draggable(
        feedback: Container(),
        child: _AwsDetectorZoomInOutMoveNodesSpace(
          // This method updates the position of the node when it moves.
          onChanged: (Offset offset) => updateNode(node.id, offset),
          node: node,
          // Calls the [hover] function if it is defined on the node when the state of [hover] changes.
          hover: (bool state) => node.hover?.call(state),
        ),
      ),
    );
  }

  /// Positions an [animated] node from [AwsNodeAnimatedNodesSpace].
  ///
  /// This function takes a [node] of type [AwsNodeAnimatedNodesSpace] and places it at a specific position on the screen.
  /// Calculates the position based on the offset provided in the node, width and height.
  /// Returns a [Positioned] widget containing the correctly positioned animated [node].
  Positioned animated(AwsNodeAnimatedNodesSpace node) {
    return Positioned(
      left: node.offset.dx - (node.width / 2),
      top: node.offset.dy - (node.height / 2),
      child: Draggable(
        feedback: Container(),
        child: AwsAniWidget(
          // Configure the animation widget with the node settings.
          setting: node.setting,
          child: _AwsDetectorMoveNodeSpace(
            node: SizedBox(
              height: node.height,
              width: node.width,
              child: node.node,
            ),
            onChanged: (Offset offset) => updateNode(node.id, offset),
          ),
        ),
      ),
    );
  }

  /// Positions a [standard] node of [AwsNodeStandardNodesSpace].
  ///
  /// Takes a [node] of type [AwsNodeStandardNodesSpace] and positions it at the desired location.
  /// This method places the node at the position calculated from its size and [offset].
  /// Returns a [Positioned] widget containing the correctly positioned [node].
  Positioned standard(AwsNodeStandardNodesSpace node) {
    return Positioned(
      left: node.offset.dx - (node.width / 2),
      top: node.offset.dy - (node.height / 2),
      child: Draggable(
        feedback: Container(),
        child: _AwsDetectorMoveNodeSpace(
          node: SizedBox(
            height: node.height,
            width: node.width,
            child: node.node,
          ),
          onChanged: (Offset offset) => updateNode(node.id, offset),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> nodeWidgets = [];

    double screenWidth =
        View.of(context).physicalSize.width / View.of(context).devicePixelRatio;
    double screenHeight = View.of(context).physicalSize.height /
        View.of(context).devicePixelRatio;
    nodeWidgets.addAll(_buildNodeWidgets(node));
    //Implement an animation to the entire node space if [animation] != null, otherwise the node space is created without any animation.
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: InteractiveViewer(
        minScale: minScale,
        maxScale: maxScale,
        constrained: false,
        child: animation == null
            ? SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Stack(
                  children: [
                    connectorPaint(context),
                    ...nodeWidgets,
                  ],
                ),
              )
            : SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: AwsAniWidget(
                  setting: animation!,
                  child: Stack(
                    children: [
                      connectorPaint(context),
                      ...nodeWidgets,
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  CustomPaint connectorPaint(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _AwsConnectorsPaintNodesSpace(
        node: node,
        connector: connector,
      ),
    );
  }
}

/// Class that creates a widget that detects and controls the animation and interaction of a node when it is hovered over in a node space of [AwsNodesSpace].
class _AwsDetectorHoverAnimatedMoveNodesSpace extends StatefulWidget {
  /// Function called when a change occurs in the node position.
  final ValueChanged<Offset> onChanged;

  /// Node that can be animated when hovering over it in space.
  final AwsNodeHoverAnimatedNodesSpace node;

  /// Constructor of class [_AwsDetectorHoverAnimatedMoveNodesSpace].
  ///
  /// [onChanged]: Function called when a change in the node position occurs.
  ///
  /// [node]: Node that can be animated when hovering over it in space.
  ///
  const _AwsDetectorHoverAnimatedMoveNodesSpace({
    required this.onChanged,
    required this.node,
  });

  @override
  State<_AwsDetectorHoverAnimatedMoveNodesSpace> createState() =>
      _AwsDetectorHoverAnimatedMoveNodesSpaceState();
}

/// State associated with [_AwsDetectorHoverAnimatedMoveNodesSpace] that manages the animation and interaction of the node when hovering in a node space of [AwsNodesSpace].
class _AwsDetectorHoverAnimatedMoveNodesSpaceState
    extends State<_AwsDetectorHoverAnimatedMoveNodesSpace> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return AwsAniWidget(
      setting: AwsAniSetting(
        animation: widget.node.animation,
        duration: widget.node.duration,
        manualTrigger: true,
        controller: (controller) {
          if (_isHovered) {
            controller.forward();
          } else {
            controller.stop();
            controller.reset();
          }
        },
      ),
      child: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.deferToChild,
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onPanUpdate: (details) {
            widget.onChanged(details.globalPosition - const Offset(25.0, 50.0));
            setState(() {
              _isHovered = true;
            });
          },
          onPanEnd: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: Container(
            height: widget.node.height,
            width: widget.node.width,
            decoration: _isHovered ? widget.node.isHover : widget.node.notHover,
            child: widget.node.node,
          ),
        ),
      ),
    );
  }
}

// Class that creates a widget that detects and controls the zoom and interaction of a node in a node space of [AwsNodesSpace].
class _AwsDetectorZoomInOutMoveNodesSpace extends StatefulWidget {
  /// Function called when a change occurs in the node position.
  final ValueChanged<Offset> onChanged;

  /// Node that can be zoomed in or out in space.
  final AwsNodeZoomInOutNodesSpace node;

  /// Optional function called when a change in the hover state is detected.
  final void Function(bool state)? hover;

  /// Constructor of class [_AwsDetectorZoomInOutMoveNodesSpace].
  ///
  /// [onChanged]: Function called when a change in the node position occurs.
  ///
  /// [node]: Node that can be zoomed in or out in space.
  ///
  /// [hover]: Optional function called when a change in the hover state is detected.

  const _AwsDetectorZoomInOutMoveNodesSpace({
    required this.onChanged,
    required this.node,
    this.hover,
  });

  @override
  State<_AwsDetectorZoomInOutMoveNodesSpace> createState() =>
      _AwsDetectorZoomInOutMoveNodesSpaceState();
}

/// State associated with [_AwsDetectorZoomInOutMoveNodesSpace] that manages the zoom and interaction of the node in a node space of [AwsNodesSpace].
class _AwsDetectorZoomInOutMoveNodesSpaceState
    extends State<_AwsDetectorZoomInOutMoveNodesSpace> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      hitTestBehavior: HitTestBehavior.deferToChild,
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
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onPanUpdate: (details) {
          widget.onChanged(details.globalPosition - const Offset(25.0, 50.0));
        },
        child: AnimatedContainer(
          duration: widget.node.duration,
          width:
              _isHovered ? widget.node.zoomIn.width : widget.node.zoomOut.width,
          height: _isHovered
              ? widget.node.zoomIn.height
              : widget.node.zoomOut.height,
          curve: widget.node.curve ?? Curves.decelerate,
          child: widget.node.node,
        ),
      ),
    );
  }
}

/// Class that creates a widget that detects and controls the resizing and interaction of a node in a node space of [AwsNodesSpace].
class _AwsDetectorSizeMoveNodesSpace extends StatefulWidget {
  /// Variable size node in space.
  final AwsNodeSizeNodesSpace node;

  /// Function called when a change occurs in the node position.
  final ValueChanged<Offset> onChanged;

  /// Constructor of class [_AwsDetectorSizeMoveNodesSpace].
  ///
  /// [node]: Variable size node in space.
  ///
  /// [onChanged]: Function called when a change in the node position occurs.
  ///
  const _AwsDetectorSizeMoveNodesSpace({
    required this.node,
    required this.onChanged,
  });

  @override
  State<_AwsDetectorSizeMoveNodesSpace> createState() =>
      _AwsDetectorSizeMoveNodesSpaceState();
}

/// State associated with [_AwsDetectorSizeMoveNodesSpace] that handles node size change and interaction in a node space of [AwsNodesSpace].
class _AwsDetectorSizeMoveNodesSpaceState
    extends State<_AwsDetectorSizeMoveNodesSpace> {
  // [oldSize]: Saves the initial size of the node.
  late Size oldSize;

  // [newSize]: saves the increased size of the node or its original size depending on the state.
  late Size newSize;

  // [state]: save the state of the node to determine its size
  bool state = false;

  @override
  void initState() {
    //initializing the node size.
    oldSize = Size(widget.node.width, widget.node.height);
    newSize = Size(widget.node.width, widget.node.height);
    super.initState();
  }

  // Updates the size of the node alternating between the original size and one increased by a defined factor.
  void updateSize() {
    setState(() {
      state = !state;
      if (state) {
        newSize = Size(oldSize.width + (oldSize.width * widget.node.increment),
            oldSize.height + (oldSize.height * widget.node.increment));
      } else {
        newSize = oldSize;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      hitTestBehavior: HitTestBehavior.deferToChild,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onDoubleTap: () => updateSize(),
        onPanUpdate: (details) {
          widget.onChanged(details.globalPosition - const Offset(25.0, 50.0));
        },
        child: AnimatedSize(
          curve: widget.node.curve,
          reverseDuration: widget.node.reverseDuration,
          duration: widget.node.duration,
          child: SizedBox(
            height: newSize.height,
            width: newSize.width,
            child: widget.node.node,
          ),
        ),
      ),
    );
  }
}

/// Private widget used to detect the movement of a node in a specific space.
class _AwsDetectorMoveNodeSpace extends StatelessWidget {
  /// Node that can be moved within space.
  final Widget node;

  /// Function called when a change occurs in the node position.
  final ValueChanged<Offset> onChanged;

  /// Constructor of class [_AwsDetectorMoveNodeSpace].
  ///
  /// [node]: Node that can be moved within the space.
  ///
  /// [onChanged]: Function called when a change in the node position occurs.
  ///
  const _AwsDetectorMoveNodeSpace({
    required this.node,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      hitTestBehavior: HitTestBehavior.deferToChild,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onPanUpdate: (details) {
          onChanged(details.globalPosition - const Offset(25.0, 50.0));
        },
        child: node,
      ),
    );
  }
}

class AwsNodeConnectorNodesSpace {
  ///[color], use this attribute to define the connector as a solid.
  final Color? color;

  ///[gradient], use this attribute to define the connector with a gradient which has different effects when moving the node.
  final LinearGradient? gradient;

  ///[thickness], use this attribute to define the thickness of the connector.
  final double thickness;

  ///[color] and [gradient], should not be used at the same time, this causes an internal conflict.
  AwsNodeConnectorNodesSpace({this.color, this.gradient, this.thickness = 2.0});
}

/// Class that defines a [CustomPainter] to draw connectors between nodes in a node space of [AwsNodesSpace].
class _AwsConnectorsPaintNodesSpace extends CustomPainter {
  /// Parent node of the node space.
  final AwsNodeElementNodesSpace node;

  /// Connector used to establish connections between nodes.
  final AwsNodeConnectorNodesSpace connector;

  /// Constructor of class [_AwsConnectorsPaintNodesSpace].
  ///
  /// [node]: Parent node of the node space.
  ///
  /// [connector]: Global connector used to establish connections between nodes if the nodes do not have their own.
  ///
  _AwsConnectorsPaintNodesSpace({
    required this.node,
    required this.connector,
  });

  //method that calculates the offset in the center of the node
  Offset offsetWH(
      {required Offset offset, required double width, required double height}) {
    return offset + Offset((width / 12), (height / 12));
  }

  //[startOffset],[endOffset] and [setting] are the variables that define where the connector starts from, where it ends and what the visual style it will have will be.
  late Offset startOffset;
  late Offset endOffset;
  late Paint setting;

  void paintConnector(AwsNodeConnectorNodesSpace? connector, Size size) {
    //check if the node has a connector defined and uses it, if it doesn't, use the global connect.
    if (connector != null) {
      //verifies that the connector is of type colo or type gradient
      if (connector.color != null && connector.gradient == null) {
        setting = Paint()
          ..color = connector.color!
          ..strokeWidth = connector.thickness
          ..style = PaintingStyle.stroke;
      } else if (connector.color == null && connector.gradient != null) {
        setting = Paint()
          ..strokeWidth = connector.thickness
          ..style = PaintingStyle.stroke
          ..shader = connector.gradient!.createShader(
              Rect.fromLTWH(size.width, 0, size.width, size.height));
      }
    } else if (connector == null) {
      //verifies that the connector is of type colo or type gradient
      if (this.connector.color != null && this.connector.gradient == null) {
        setting = Paint()
          ..color = this.connector.color!
          ..strokeWidth = this.connector.thickness
          ..style = PaintingStyle.stroke;
      } else if (this.connector.color == null &&
          this.connector.gradient != null) {
        setting = Paint()
          ..strokeWidth = this.connector.thickness
          ..style = PaintingStyle.stroke
          ..shader = this.connector.gradient!.createShader(
              Rect.fromLTWH(size.width, 0, size.width, size.height));
      }
    } else {
      throw 'you must set gradient or color to have a solid connector.';
    }
  }

  /// Draws connections between nodes on the canvas, starting from a parent node.
  ///
  /// This function iterates through the connected nodes of the parent node,
  /// drawing connectors and lines between them and their connected nodes recursively.
  ///
  /// [canvas]: The canvas on which to draw the connections.
  /// [parentNode]: The parent node from which connections are drawn.
  /// [size]: The size used for calculations and drawing.
  void drawConnections(
      Canvas canvas, AwsNodeElementNodesSpace parentNode, Size size) {
    late Offset startOffset;
    // set the position of the parent node
    if (parentNode is AwsNodeStandardNodesSpace) {
      startOffset = offsetWH(
          offset: parentNode.offset,
          width: parentNode.width,
          height: parentNode.height);
    } else if (parentNode is AwsNodeZoomInOutNodesSpace) {
      startOffset = parentNode.offset +
          Offset((parentNode.zoomOut.width / 12),
              (parentNode.zoomOut.height / 12));
    } else if (parentNode is AwsNodeSizeNodesSpace) {
      startOffset = offsetWH(
          offset: parentNode.offset,
          width: parentNode.width,
          height: parentNode.height);
    } else if (parentNode is AwsNodeAnimatedNodesSpace) {
      startOffset = offsetWH(
          offset: parentNode.offset,
          width: parentNode.width,
          height: parentNode.height);
    } else if (parentNode is AwsNodeHoverAnimatedNodesSpace) {
      startOffset = offsetWH(
          offset: parentNode.offset,
          width: parentNode.width,
          height: parentNode.height);
    }

    //check if there are nodes connected to the parent node
    if (parentNode.connectedNodes != null) {
      // Draw connections and set the position for nodes connected to these connected nodes (recursion)
      for (var connectedNode in parentNode.connectedNodes!) {
        //Set the position, paint and draw the connector towards the parent node depending on the node type
        if (connectedNode is AwsNodeStandardNodesSpace) {
          final endOffset = offsetWH(
              offset: connectedNode.offset,
              width: connectedNode.width,
              height: connectedNode.height);
          paintConnector(connectedNode.connector, size);
          canvas.drawLine(startOffset, endOffset, setting);
          drawConnections(canvas, connectedNode, size);
        } else if (connectedNode is AwsNodeZoomInOutNodesSpace) {
          final endOffset = connectedNode.offset +
              Offset((connectedNode.zoomOut.width / 12),
                  (connectedNode.zoomOut.height / 12));
          paintConnector(connectedNode.connector, size);
          canvas.drawLine(startOffset, endOffset, setting);
          drawConnections(canvas, connectedNode, size);
        } else if (connectedNode is AwsNodeSizeNodesSpace) {
          Size newSize = Size(
              connectedNode.width +
                  (connectedNode.width * connectedNode.increment),
              connectedNode.height +
                  (connectedNode.height * connectedNode.increment));
          final endOffset = offsetWH(
              offset: connectedNode.offset,
              width: newSize.width,
              height: newSize.height);
          paintConnector(connectedNode.connector, size);
          canvas.drawLine(startOffset, endOffset, setting);
          drawConnections(canvas, connectedNode, size);
        } else if (connectedNode is AwsNodeAnimatedNodesSpace) {
          final endOffset = offsetWH(
              offset: connectedNode.offset,
              width: connectedNode.width,
              height: connectedNode.height);
          paintConnector(connectedNode.connector, size);
          canvas.drawLine(startOffset, endOffset, setting);
          drawConnections(canvas, connectedNode, size);
        } else if (connectedNode is AwsNodeHoverAnimatedNodesSpace) {
          final endOffset = offsetWH(
              offset: connectedNode.offset,
              width: connectedNode.width,
              height: connectedNode.height);
          paintConnector(connectedNode.connector, size);
          canvas.drawLine(startOffset, endOffset, setting);
          drawConnections(canvas, connectedNode, size);
        }
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Set the position of the parent node
    if (node is AwsNodeStandardNodesSpace) {
      startOffset = offsetWH(
          offset: node.offset,
          width: (node as AwsNodeStandardNodesSpace).width,
          height: (node as AwsNodeStandardNodesSpace).height);
    } else if (node is AwsNodeZoomInOutNodesSpace) {
      startOffset = node.offset +
          Offset(((node as AwsNodeZoomInOutNodesSpace).zoomOut.width / 12),
              ((node as AwsNodeZoomInOutNodesSpace).zoomOut.height / 12));
    } else if (node is AwsNodeSizeNodesSpace) {
      startOffset = offsetWH(
          offset: (node as AwsNodeSizeNodesSpace).offset,
          width: (node as AwsNodeSizeNodesSpace).width,
          height: (node as AwsNodeSizeNodesSpace).height);
    } else if (node is AwsNodeAnimatedNodesSpace) {
      startOffset = offsetWH(
          offset: (node as AwsNodeAnimatedNodesSpace).offset,
          width: (node as AwsNodeAnimatedNodesSpace).width,
          height: (node as AwsNodeAnimatedNodesSpace).height);
    } else if (node is AwsNodeHoverAnimatedNodesSpace) {
      startOffset = offsetWH(
          offset: (node as AwsNodeHoverAnimatedNodesSpace).offset,
          width: (node as AwsNodeHoverAnimatedNodesSpace).width,
          height: (node as AwsNodeHoverAnimatedNodesSpace).height);
    }

    //draw the connectors of all the nodes in the space.
    drawConnections(canvas, node, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
