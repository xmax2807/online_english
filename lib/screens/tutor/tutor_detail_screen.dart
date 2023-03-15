import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';
import 'package:online_english/screens/tutor/tutor_book_screen.dart';
import 'package:readmore/readmore.dart';

import '../../gen/assets.gen.dart';
import '../../utils/theme/my_theme.dart';
import 'components/button_group.dart';

class TutorDetailScreen extends StatelessWidget {
  const TutorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            TeacherProfileWidget(
              teacherName: "asd",
              nationality: "France",
              svgFlag: Assets.flags.fr,
              dimension: 100,
              rating: 5,
            ),
            const TutorButtonGroup(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  style: MyTheme.outlineButtonStyle,
                  child: const Text("Message me"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutorBookingScreen()),
                      );
                    },
                    style: MyTheme.flatButtonStyle,
                    child: const Text("Start learning with me")),
              ],
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Text(
                "About me",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: ReadMoreText(
                "The Moon is a barren, rocky world without air and water. It has dark lava plain on its surface. The Moon is filled wit craters. It has no light of its own. It gets its light from the Sun. The Moo keeps changing its shape as it moves round the Earth. It spins on its axis in 27.3 days stars were named after the Edwin Aldrin were the first ones to set their foot on the Moon on 21 July 1969 They reached the Moon in their space craft named Apollo II.",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.colors.secondaryColor),
                lessStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.colors.secondaryColor),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 8,
              title: Text(
                "Teaching Experience",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: const Text("100 years experience in AAA Game Dev"),
            ),
            const Placeholder(),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 8,
              title: Text(
                "Languages",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 0; i < 5; i++)
                    TextButton(
                      onPressed: () {},
                      style: MyTheme.tagButtonStyle,
                      child: Text("asd $i"),
                    ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              minVerticalPadding: 8,
              title: Text(
                "Specialties",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 0; i < 5; i++)
                    TextButton(
                      onPressed: () {},
                      style: MyTheme.tagButtonStyle,
                      child: Text("asd $i"),
                    ),
                ],
              ),
            ),
          ]),
    );
  }
}
