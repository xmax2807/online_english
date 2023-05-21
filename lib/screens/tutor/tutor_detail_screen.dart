import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';
import 'package:online_english/screens/tutor/tutor_book_screen.dart';
import 'package:readmore/readmore.dart';

import '../../data/model/tutor_model/dto/detail_teacher_profile.dart';
import '../../services/tutor_info_service.dart';
import '../../utils/theme/my_theme.dart';
import '../view_course_screen/view_course_screen.dart';
import 'components/button_group.dart';

class TutorDetailScreen extends ConsumerStatefulWidget {
  final String tutorId;
  const TutorDetailScreen({super.key, required this.tutorId});

  @override
  ConsumerState<TutorDetailScreen> createState() => _TutorDetailScreen();
}

class _TutorDetailScreen extends ConsumerState<TutorDetailScreen> {
  late final TutorInfoService _service;
  @override
  void initState() {
    super.initState();

    _service = ref.read(tutorDetailServiceProvider);
    _service.getTutorDetail(widget.tutorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, _) {
        if (ref.watch(tutorDetailServiceProvider).detailInfo == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final TeacherDetailDTO data = _service.detailInfo!;
        return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: [
              TeacherProfileWidget(
                teacherName: data.user.name ?? 'Unknown',
                nationality: data.user.country ?? '',
                svgFlag: 'assets/flags/${data.user.country?.toLowerCase()}.svg',
                avatar: data.user.avatar ?? '',
                dimension: 100,
                rating: data.avgRating,
              ),
              TutorButtonGroup(
                isFav: data.isFavorite != null,
              ),
              const SizedBox(
                height: 10,
              ),
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
                              builder: (context) => TutorBookingScreen(
                                    tutorId: widget.tutorId,
                                  )),
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
                  data.bio,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                      fontSize: 16, color: MyTheme.colors.secondaryColor),
                  lessStyle: TextStyle(
                      fontSize: 16, color: MyTheme.colors.secondaryColor),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(8),
                minVerticalPadding: 8,
                title: Text(
                  "Teaching Experience",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(data.experience ?? ''),
              ),
              if (data.user.courses != null)
                ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  minVerticalPadding: 8,
                  title: Text(
                    "My Courses",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data.user.courses!
                        .map<RichText>(
                          (e) => RichText(
                            text: TextSpan(
                                text: e.name,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewCourseScreen(
                                                courseId: e.id,
                                              )),
                                    );
                                  }),
                          ),
                        )
                        .toList(),
                  ),
                ),
              if (_service.isVideoAvailable)
                SizedBox(
                  height: 360,
                  child: FlickVideoPlayer(
                      flickManager: _service.flickManager,
                      flickVideoWithControls: const FlickVideoWithControls(
                        videoFit: BoxFit.contain,
                        controls: FlickPortraitControls(),
                      )),
                ),
              if (data.languages != null)
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
                      for (String lang in data.languages!.split(','))
                        TextButton(
                          onPressed: () {},
                          style: MyTheme.tagButtonStyle,
                          child: Text(AppSetting.instance.countryHelper
                              .getLanguangeName(lang)),
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
                subtitle: data.specialties == null
                    ? null
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (String skill in data.specialties!.split(','))
                            TextButton(
                              onPressed: () {},
                              style: MyTheme.tagButtonStyle,
                              child: Text(AppSetting
                                      .instance.essentialKeyValues[skill] ??
                                  skill),
                            ),
                        ],
                      ),
              ),
            ]);
      }),
    );
  }
}
