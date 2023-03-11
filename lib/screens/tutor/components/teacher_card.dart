import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';

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
      // decoration: const BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.all(Radius.circular(15)),
      //     boxShadow: [
      //       BoxShadow(
      //           blurRadius: 1,
      //           spreadRadius: 0.01,
      //           color: Color.fromARGB(150, 0, 0, 0))
      //     ]),
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
                  height: 90,
                  child: Row(
                    // profile + react
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TeacherProfileWidget(
                          teacherName: "ASD",
                          nationality: "France",
                          svgFlag: Assets.flags.fr,
                          rating: 5,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              pressed = !pressed;
                            });
                          },
                          child: SvgPicture.asset(
                            pressed == true
                                ? Assets.myCustomIcons.hearts.heartFill
                                : Assets.myCustomIcons.hearts.heartOutline,
                            colorFilter: ColorFilter.mode(
                                MyTheme.colors.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
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
                    onPressed: () {},
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
