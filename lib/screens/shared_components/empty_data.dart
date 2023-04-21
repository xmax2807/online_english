import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Image(image: Assets.images.emptyResult.provider()),
          Text(
            "No data found",
            style: Theme.of(context).textTheme.headlineLarge,
          )
        ],
      ),
    );
  }
}
