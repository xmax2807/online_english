import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: min(250, context.width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: Assets.images.emptyResult.provider()),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "No data found",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
