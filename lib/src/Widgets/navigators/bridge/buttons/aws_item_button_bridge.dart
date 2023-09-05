import 'package:flutter/cupertino.dart';

class AwsItemButtonBridge<T> {
  final T value;
  final IconData icon;
  final String label;

  const AwsItemButtonBridge({
    required this.value,
    required this.icon,
    required this.label,
  });
}
