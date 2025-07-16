import 'package:flutter/widgets.dart';

extension IntExtention on int {
  int validator({int value = 0}) {
    return this;
  }

  Widget get h => SizedBox(height: toDouble());
  Widget get w => SizedBox(width: toDouble());
}
