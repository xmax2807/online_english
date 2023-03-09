import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeacherProfileWidget extends StatelessWidget {
  final String teacherName, nationality;
  final SvgPicture? flag;
  final double? rating;
  final ImageProvider<Object>? avatar;

  final RatingBarIndicator? ratingBar = RatingBarIndicator(
    rating: 0,
    itemBuilder: (context, index) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 50.0,
    direction: Axis.horizontal,
  );
  TeacherProfileWidget(
      {super.key,
      required this.teacherName,
      required this.nationality,
      this.flag,
      this.rating = 0,
      this.avatar});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
