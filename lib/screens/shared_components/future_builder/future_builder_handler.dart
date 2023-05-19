import 'package:flutter/material.dart';

abstract class FutureBuilderHandlerWidget<T> extends StatelessWidget {
  const FutureBuilderHandlerWidget(
      {super.key, required this.future, required this.builder});

  final Future<T> future;
  final Function(BuildContext context, T? response) builder;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data);
        } else if (snapshot.hasError) {
          return onErrorWidget(snapshot.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget onErrorWidget(Object? error) {
    return Text('Error: $error');
  }
}
