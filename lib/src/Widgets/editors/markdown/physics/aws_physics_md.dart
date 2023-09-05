import 'package:flutter/material.dart';

class AwsCustomizePhysicsMD extends ScrollPhysics {
  const AwsCustomizePhysicsMD({
    ScrollPhysics? parent,
  }) : super(parent: parent);

  @override
  AwsCustomizePhysicsMD applyTo(ScrollPhysics? ancestor) {
    return AwsCustomizePhysicsMD(parent: buildParent(ancestor));
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) => false;

  @override
  bool get allowImplicitScrolling => false;

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    return 0;
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    return null;
  }
}
