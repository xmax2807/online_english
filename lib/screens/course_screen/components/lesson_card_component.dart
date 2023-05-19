import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/model/course_model/category_model/category_key.dart';
import '../../../data/model/course_model/dto/course_basic_dto.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/theme/my_theme.dart';

class LessonCardWidget extends StatelessWidget {
  final CourseBasicDTO data;
  const LessonCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(children: [
          Flexible(
              child: CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: data.imageUrl ?? Assets.images.loginScreenBG.path,
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
                    title: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        data.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      data.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: MyTheme.colors.lightGray),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryLevel[data.level ?? 0],
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                      Text(
                        '${data.courseLength} topics',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
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
