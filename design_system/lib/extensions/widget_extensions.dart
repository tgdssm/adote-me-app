import 'package:flutter/material.dart';

extension DefaultPadding on Widget {
  addPadding() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: this,
      );
}
