import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/future_builder/future_builder_handler.dart';

class APIRequestFutureBuilder<T> extends FutureBuilderHandlerWidget<T> {
  final Widget? customErrorWidget;
  const APIRequestFutureBuilder(this.customErrorWidget,
      {super.key, required super.future, required super.builder});

  @override
  Widget onErrorWidget(Object? error) {
    return customErrorWidget ?? super.onErrorWidget(error);
  }
}
