import 'dart:async';

import 'package:flutter/material.dart';

class ConsumerWidget<T> extends StatefulWidget {
  final Stream<T> stream;
  final Widget Function(BuildContext, AsyncSnapshot<T>) builder;
  const ConsumerWidget({Key? key, required this.stream, required this.builder}) : super(key: key);

  @override
  State<ConsumerWidget<T>> createState() => _ConsumerWidgetState<T>();
}

class _ConsumerWidgetState<T> extends State<ConsumerWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.stream,
      builder: widget.builder,
    );
  }
}
