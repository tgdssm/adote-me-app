import 'package:flutter/material.dart';

extension DefaultPadding on Widget {
  addPadding({double horizontal = 40, double vertical = 40}) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
}
