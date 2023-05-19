import 'package:core/app/app_module.dart';
import 'package:core/app/app_widget.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
