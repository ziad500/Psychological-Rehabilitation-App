import 'package:flutter/material.dart';
import 'package:phsyo/shared/constraints.dart';

class Responsive extends StatelessWidget {
  final Widget mobileWidget;
  final Widget tabletWidget;

  const Responsive({required this.mobileWidget, required this.tabletWidget});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ktabletwidth) {
          return tabletWidget;
        } else {
          return mobileWidget;
        }
      },
    );
  }
}
