import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/my_icon_button.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';
import 'package:online_english/screens/tutor/tutor_book_screen.dart';
import 'package:online_english/screens/tutor/tutor_detail_screen.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/theme/my_theme.dart';

class TeacherCardWidget extends StatefulWidget {
  final List<String> tags = [
    "Flutter",
    "OOP",
    "Design Pattern",
    "Dynamic Programming",
    "Deep Learning",
    "Reactive Programming"
  ];

  TeacherCardWidget({super.key});
  @override
  State<StatefulWidget> createState() => TeacherCardState();
}

class TeacherCardState extends State<TeacherCardWidget> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Colors.white,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    // profile + react
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TutorDetailScreen()),
                            );
                          },
                          child: TeacherProfileWidget(
                            teacherName: "ASD",
                            nationality: "France",
                            svgFlag: Assets.flags.fr,
                            rating: 5,
                            dimension: 70,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          child: MyToggleButton(
                              toggleOffIcon:
                                  Assets.myCustomIcons.hearts.heartOutline,
                              toggleOnIcon:
                                  Assets.myCustomIcons.hearts.heartFill)),
                    ],
                  ),
                ),
                ExtendedWrap(
                  maxLines: 2,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (String tag in widget.tags)
                      TextButton(
                          style: MyTheme.tagButtonStyle,
                          onPressed: () {},
                          child: Text(tag)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(
                  child: Text(
                    'Text largeeeeeeeeeeeeeeeeeeeeeeeas lkdjalsjdlajsldkj alksjdlajsldkjals',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    style: MyTheme.outlineButtonStyle,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                    label: const Text("Book"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutorBookingScreen()),
                      );
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
