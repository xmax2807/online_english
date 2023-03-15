import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/theme/my_theme.dart';

class LessonCardWidget extends StatelessWidget {
  const LessonCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(children: [
          Flexible(
              child: Image(
            fit: BoxFit.fitWidth,
            image: Assets.images.loginScreenBG.provider(),
          )),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0, right: 0),
                    title: Text(
                      "Design Pattern",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      "Description",
                      style: TextStyle(color: MyTheme.colors.lightGray),
                    ),
                  ),
                  Text(
                    "Intermediate",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
