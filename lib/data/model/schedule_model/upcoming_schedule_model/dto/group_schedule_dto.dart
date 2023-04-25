import 'package:online_english/data/model/tutor_model/dto/basic_teacher_info.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

import '../upcoming_schedule_model.dart';

class ScheduleTime {
  final String id;
  late final DateTime from;
  late final DateTime to;

  ScheduleTime(this.id, this.from, this.to);
  ScheduleTime.fromTimestamp(this.id, int fromTimpstamp, int toTimpstamp) {
    from = DateTime.fromMillisecondsSinceEpoch(fromTimpstamp);
    to = DateTime.fromMillisecondsSinceEpoch(toTimpstamp);
  }
  int compareTo(ScheduleTime other) {
    if (to.isBefore(other.from)) return -1;
    if (from.isAfter(other.to)) return 1;
    return 0;
  }

  String get durationTime =>
      '${from.toStringFormat(format: 'hh:mm')} - ${to.toStringFormat(format: 'hh:mm')}';
}

class GroupScheduleDTO {
  late final List<ScheduleTime> _lessonTimes;
  final BasicTeacherInfo teacherInfo;
  final DateTime _date;
  late final int Function(ScheduleTime, ScheduleTime) _comparer;

  GroupScheduleDTO(this._lessonTimes, this.teacherInfo, this._date) {
    _comparer = _defaultComparer;
  }
  GroupScheduleDTO.fromElement(
      ScheduleTime first, this._date, this.teacherInfo) {
    _lessonTimes = [first];
    _comparer = _defaultComparer;
  }

  String getGroupTime() {
    final first = _lessonTimes.first;
    final last = _lessonTimes.last;
    return '${first.from.toStringFormat(format: 'hh:mm')} - ${last.to.toStringFormat(format: 'hh:mm')}';
  }

  String getDate() => _date.toStringFormat();

  int _defaultComparer(ScheduleTime a, ScheduleTime b) {
    if (a.id == b.id) return 0;

    return a.compareTo(b);
  }

  int get length => _lessonTimes.length;
  List<ScheduleTime>? unmodifiablelessonTimes;
  List<ScheduleTime> get lessonTimes {
    unmodifiablelessonTimes ??= List.unmodifiable(_lessonTimes);
    return unmodifiablelessonTimes!;
  }

  bool tryAdd(ScheduleTime time) {
    int which = _lessonTimes.last.compareTo(time);
    if (which == 0) {
      return false;
    }

    _lessonTimes.add(time);
    _lessonTimes.sort(_comparer);
    return true;
  }

  bool equalToModel(UpcomingScheduleModel model) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(model.scheduleInfo.startTimestamp);
    return teacherInfo.id == model.scheduleInfo.tutorId &&
        _date.hasSameDate(date);
  }

  bool equalToOther(GroupScheduleDTO other) {
    return teacherInfo.id == other.teacherInfo.id &&
        _lessonTimes.first.from == other._lessonTimes.first.from;
  }

  List<GroupScheduleDTO> split(Duration interval) {
    List<GroupScheduleDTO> result = [];

    for (int i = 1; i <= _lessonTimes.length; i++) {
      int startIndex = i - 1;
      while (i < _lessonTimes.length) {
        final after = _lessonTimes[i].from;
        final before = _lessonTimes[i - 1].to;
        bool isInInterval = after.subtract(interval).isBefore(before);

        if (!isInInterval) break;
        ++i;
      }
      GroupScheduleDTO splitted = GroupScheduleDTO(
          _lessonTimes.sublist(startIndex, i), teacherInfo, _date);
      result.add(splitted);
    }
    return result;
  }
}

class GroupScheduleFactory {
  static List<GroupScheduleDTO> createListFrom(
      List<UpcomingScheduleModel> dataList) {
    List<GroupScheduleDTO> generatedList = [];

    for (UpcomingScheduleModel model in dataList) {
      bool canBeAdded = false;
      final scheduleTime = ScheduleTime.fromTimestamp(
        model.id,
        model.scheduleInfo.startTimestamp,
        model.scheduleInfo.endTimestamp,
      );

      // model should have same tutor's id and start time
      for (GroupScheduleDTO group in generatedList) {
        if (!group.equalToModel(model)) continue;

        canBeAdded = group.tryAdd(scheduleTime);

        if (canBeAdded) break;
      }

      //Create new group if can't add the time to any previous groups
      if (!canBeAdded) {
        generatedList.add(
          GroupScheduleDTO.fromElement(
              scheduleTime,
              DateTime.fromMillisecondsSinceEpoch(
                  model.scheduleInfo.endTimestamp),
              model.scheduleInfo.tutorInfo),
        );
      }
    }

    List<GroupScheduleDTO> result = [];

    for (GroupScheduleDTO group in generatedList) {
      final splitted = group.split(const Duration(minutes: 5, seconds: 1));
      result.addAll(splitted);
    }

    return result;
  }
}
