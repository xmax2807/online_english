import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/tutor_model/dto/overview_teacher_profile.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:online_english/screens/shared_components/my_icon_button.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';
import 'package:online_english/screens/tutor/tutor_book_screen.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/theme/my_theme.dart';

class TeacherCardWidget extends StatefulWidget {
  final List<String> tags = [];
  final TeacherOverviewDTO dto;
  final void Function() onTap;
  TeacherCardWidget({super.key, required this.dto, required this.onTap});
  @override
  State<StatefulWidget> createState() => TeacherCardState();
}

class TeacherCardState extends State<TeacherCardWidget> {
  bool pressed = false;
  TeacherOverviewDTO get currentDTO => widget.dto;
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
          child: Consumer(builder: (context, ref, _) {
            return Column(
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
                            onTap: widget.onTap,
                            child: TeacherProfileWidget(
                              teacherName: currentDTO.name,
                              nationality: currentDTO.country,
                              svgFlag:
                                  'assets/flags/${currentDTO.country.toLowerCase()}.svg',
                              rating: currentDTO.rating,
                              avatar: currentDTO.avatar,
                              dimension: 70,
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: MyToggleButton(
                                onToggle: null,
                                isOn: currentDTO.isfavoritetutor != null &&
                                    currentDTO.isfavoritetutor! == '1',
                                toggleOffIcon:
                                    Assets.myCustomIcons.hearts.heartOutline,
                                toggleOnIcon:
                                    Assets.myCustomIcons.hearts.heartFill)),
                      ],
                    ),
                  ),
                  ExtendedWrap(
                    maxLines: 1,
                    spacing: 5,
                    //runSpacing: -10,
                    children: [
                      for (String tag in currentDTO.specialties.split(','))
                        TextButton(
                          style: MyTheme.tagButtonStyle,
                          onPressed: () {},
                          child: Text(
                              AppSetting.instance.essentialKeyValues[tag] ??
                                  tag),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      currentDTO.bio,
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
                              builder: (context) => TutorBookingScreen(
                                    tutorId: widget.dto.userId,
                                  )),
                        );
                      },
                    ),
                  )
                ]);
          }),
        ),
      ),
    );
  }
}
