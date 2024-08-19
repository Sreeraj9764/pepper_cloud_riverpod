import 'package:flutter/material.dart';

extension GetTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}