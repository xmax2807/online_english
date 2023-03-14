import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TeacherProfileWidget extends StatelessWidget {
  final String teacherName, nationality, svgFlag;
  final SvgPicture? flag;
  final double? rating;
  final String avatar;
  final double dimension;
  const TeacherProfileWidget({
    super.key,
    required this.teacherName,
    required this.nationality,
    required this.svgFlag,
    this.dimension = 80,
    this.flag,
    this.rating = 0,
    this.avatar = "assets/my_custom_icons/avatar.svg",
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox.square(
        dimension: dimension,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000),
          child: SvgPicture.asset(
            avatar,
          ),
        ),
      ),
      const SizedBox(width: 10),
      SizedBox(
        height: dimension,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacherName,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 15,
                  child: SvgPicture.asset(
                    svgFlag,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(nationality),
              ],
            ),
            RatingBarIndicator(
              rating: rating!,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      )
    ]);
  }
}
