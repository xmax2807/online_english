import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../../data/model/schedule_model/upcoming_schedule_model/dto/group_schedule_dto.dart';
import '../../../services/upcoming_schedule_service.dart';
import 'cancel_popup.dart';

class LessonRequestContainer extends ConsumerWidget {
  final UpcomingScheduleService _service;
  final UpcomingScheduleGroup _groupData;

  const LessonRequestContainer(this._service, this._groupData, {super.key});

  void _handleCancel(BuildContext context, ScheduleTime timeData) {
    cancelPopup(
      context,
      timeData.from,
      timeData.to,
      _service.cancelReasons!,
      (reasonId, note) async {
        String result =
            await _service.cancelLesson(timeData.id, reasonId, note);
        if (context.mounted) {
          resultPopup(context, 'Schedule Deleting Result', result);
        }
      },
    );
  }

  List<Widget> getLessonWidgets(BuildContext context) {
    return List.generate(_groupData.lessonTimes.length,
        (index) => onBuildSession(context, index));
  }

  Widget onBuildSession(BuildContext context, int index) {
    ScheduleTime timeData = _groupData.lessonTimes[index];
    bool canCancel = _service.canCancel(timeData.from);
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Session ${index + 1} : ${timeData.durationTime}',
            style: const TextStyle(fontSize: 16),
          ),
          Container(
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                  color: !canCancel ? MyTheme.colors.lightGray : Colors.red,
                  width: 1),
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: IconButton(
                onPressed:
                    !canCancel ? null : () => _handleCancel(context, timeData),
                icon: const Icon(
                  Icons.clear_rounded,
                ),
                color: MyTheme.colors.red,
                disabledColor: MyTheme.colors.lightGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          ListTile(
            title: Text(
              _groupData.getGroupTime(),
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 24, color: MyTheme.colors.primaryColor),
            ),
            subtitle: Column(
              children: getLessonWidgets(context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ExpansionTile(
            collapsedShape: RoundedRectangleBorder(
                side: BorderSide(color: MyTheme.colors.primaryColor),
                borderRadius: BorderRadius.circular(10)),
            backgroundColor: MyTheme.colors.onPrimaryColor,
            title: const Text("Request for lesson"),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 1')),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                    style: MyTheme.outlineButtonStyle,
                    onPressed: () {},
                    child: const Text(
                      "Edit request",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: MyTheme.colors.secondaryColor,
                      disabledBackgroundColor:
                          MyTheme.colors.lightGray.withOpacity(0.5),
                      foregroundColor: MyTheme.colors.onSecondaryColor,
                    ).merge(MyTheme.flatButtonStyle),
                    onPressed: !_service.canGoToMeeting(_groupData)
                        ? null
                        : () => _service.goToMeeting(_groupData),
                    child: const Text(
                      "Go to meeting",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
