import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../data/model/tutor_lesson_review/tutor_lesson_review.dart';

class LessonTutorReview extends StatelessWidget {
  final TutorLessonReviewModel model;
  const LessonTutorReview({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Lesson status: Completed - 40 pages"),
          const Divider(),
          ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("Your Rating"),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: model.ratings
                      .map((rating) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(rating.label),
                                RatingBarIndicator(
                                  rating: rating.value,
                                  itemSize: 16,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                )
                              ]))
                      .toList())),
          const Divider(),
          Text(model.comments),
        ],
      ),
    );
  }
}
