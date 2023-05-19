import 'package:online_english/data/model/tutor_model/dto/basic_teacher_info.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

import '../../history_schedule_model/history_schedule_model.dart';
import '../../history_schedule_model/tutor_review_model.dart';
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

class ScheduleTimeWithReview extends ScheduleTime {
  final TutorReviewModel? review;
  ScheduleTimeWithReview(super.id, super.from, super.to, this.review);
  ScheduleTimeWithReview.fromTimestamp(
    String id,
    int fromTimpstamp,
    int toTimpstamp,
    this.review,
  ) : super.fromTimestamp(id, fromTimpstamp, toTimpstamp);

  @override
  int compareTo(ScheduleTime other) {
    int superResult = super.compareTo(other);
    if (superResult != 0) {
      return superResult;
    }

    if (other is! ScheduleTimeWithReview) return 1;
    if (other.review == null) return 1;
    if (review == null) return -1;
    return 0;
  }
}

abstract class GroupScheduleDTO<T extends ScheduleTime> {
  late final List<ScheduleTime> _lessonTimes;
  final BasicTeacherInfo teacherInfo;
  final DateTime _date;
  final String? studentRequest;
  late final int Function(ScheduleTime, ScheduleTime) _comparer;

  GroupScheduleDTO(
      this._lessonTimes, this.teacherInfo, this._date, this.studentRequest) {
    _comparer = _defaultComparer;
  }
  GroupScheduleDTO.fromElement(
      ScheduleTime first, this._date, this.teacherInfo, this.studentRequest) {
    _lessonTimes = [first];
    _comparer = _defaultComparer;
  }

  int _defaultComparer(ScheduleTime a, ScheduleTime b) {
    if (a.id == b.id) return 0;

    return a.compareTo(b);
  }

  int get length => _lessonTimes.length;
  List<T>? unmodifiablelessonTimes;
  List<T> get lessonTimes {
    unmodifiablelessonTimes ??= List.unmodifiable(_lessonTimes);
    return unmodifiablelessonTimes!;
  }

  List<GroupScheduleDTO> split(Duration interval);

  bool tryAdd(T time) {
    int which = _lessonTimes.last.compareTo(time);
    if (which == 0) {
      return false;
    }

    _lessonTimes.add(time);
    _lessonTimes.sort(_comparer);
    return true;
  }

  String getGroupTime() {
    final first = _lessonTimes.first;
    final last = _lessonTimes.last;
    return '${first.from.toStringFormat(format: 'hh:mm')} - ${last.to.toStringFormat(format: 'hh:mm')}';
  }

  String getDateString() => _date.toStringFormat();
  DateTime getDate() => _date;
}

class UpcomingScheduleGroup extends GroupScheduleDTO<ScheduleTime> {
  UpcomingScheduleGroup(List<ScheduleTime> lessonTimes,
      BasicTeacherInfo teacherInfo, DateTime date, String? studentRequest)
      : super(lessonTimes, teacherInfo, date, studentRequest);
  UpcomingScheduleGroup.fromElement(ScheduleTime first, DateTime date,
      BasicTeacherInfo teacherInfo, String? studentRequest)
      : super.fromElement(first, date, teacherInfo, studentRequest);

  bool isInRange(DateTime time) {
    DateTime from = _lessonTimes.first.from;
    DateTime to = _lessonTimes.last.to;
    return time.isInRange(from, to);
  }

  bool equalToModel(UpcomingScheduleModel model) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(model.scheduleInfo.startTimestamp);
    return teacherInfo.id == model.scheduleInfo.tutorId &&
        _date.hasSameDate(date);
  }

  bool equalToOther(UpcomingScheduleGroup other) {
    return teacherInfo.id == other.teacherInfo.id &&
        _lessonTimes.first.from == other._lessonTimes.first.from;
  }

  @override
  List<UpcomingScheduleGroup> split(Duration interval) {
    List<UpcomingScheduleGroup> result = [];

    for (int i = 1; i <= _lessonTimes.length; i++) {
      int startIndex = i - 1;
      while (i < _lessonTimes.length) {
        final after = _lessonTimes[i].from;
        final before = _lessonTimes[i - 1].to;
        bool isInInterval = after.subtract(interval).isBefore(before);

        if (!isInInterval) break;
        ++i;
      }
      UpcomingScheduleGroup splitted =
          clone(_lessonTimes.sublist(startIndex, i));
      result.add(splitted);
    }
    return result;
  }

  UpcomingScheduleGroup clone(List<ScheduleTime> list) {
    return UpcomingScheduleGroup(list, teacherInfo, _date, studentRequest);
  }
}

class HistoryScheduleGroup extends GroupScheduleDTO<ScheduleTimeWithReview> {
  final String? recordUrl;
  HistoryScheduleGroup.fromElement(
    super.first,
    super.date,
    super.teacherInfo,
    super.studentRequest,
    this.recordUrl,
  ) : super.fromElement();

  HistoryScheduleGroup(
    super.lessonTimes,
    super.teacherInfo,
    super.date,
    super.studentRequest,
    this.recordUrl,
  );

  HistoryScheduleGroup clone(List<ScheduleTime> list) {
    return HistoryScheduleGroup(
        list, teacherInfo, _date, studentRequest, recordUrl);
  }

  bool equalToHistory(HistoryScheduleModel model) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(model.scheduleInfo.startTimestamp);
    return teacherInfo.id == model.scheduleInfo.tutorId &&
        _date.hasSameDate(date);
  }

  @override
  List<HistoryScheduleGroup> split(Duration interval) {
    List<HistoryScheduleGroup> result = [];

    for (int i = 1; i <= _lessonTimes.length; i++) {
      int startIndex = i - 1;
      while (i < _lessonTimes.length) {
        final after = _lessonTimes[i].from;
        final before = _lessonTimes[i - 1].to;
        bool isInInterval = after.subtract(interval).isBefore(before);

        if (!isInInterval) break;
        ++i;
      }
      HistoryScheduleGroup splitted =
          clone(_lessonTimes.sublist(startIndex, i));
      result.add(splitted);
    }
    return result;
  }
}

class GroupScheduleFactory {
  static List<UpcomingScheduleGroup> createListFromUpcoming(
      List<UpcomingScheduleModel> dataList) {
    List<UpcomingScheduleGroup> generatedList = [];

    for (UpcomingScheduleModel model in dataList) {
      bool canBeAdded = false;
      final scheduleTime = ScheduleTime.fromTimestamp(
        model.id,
        model.scheduleInfo.startTimestamp,
        model.scheduleInfo.endTimestamp,
      );

      // model should have same tutor's id and start time
      for (UpcomingScheduleGroup group in generatedList) {
        if (!group.equalToModel(model)) continue;

        canBeAdded = group.tryAdd(scheduleTime);

        if (canBeAdded) break;
      }

      //Create new group if can't add the time to any previous groups
      if (!canBeAdded) {
        generatedList.add(
          UpcomingScheduleGroup.fromElement(
              scheduleTime,
              DateTime.fromMillisecondsSinceEpoch(
                  model.scheduleInfo.endTimestamp),
              model.scheduleInfo.tutorInfo,
              model.studentRequest),
        );
      }
    }

    List<UpcomingScheduleGroup> result = [];

    for (UpcomingScheduleGroup group in generatedList) {
      final splitted = group.split(const Duration(minutes: 5, seconds: 1));
      result.addAll(splitted);
    }

    return result;
  }

  static List<HistoryScheduleGroup> createListFromHistory(
      List<HistoryScheduleModel> dataList) {
    List<HistoryScheduleGroup> generatedList = [];

    for (HistoryScheduleModel model in dataList) {
      bool canBeAdded = false;
      final scheduleTime = ScheduleTimeWithReview.fromTimestamp(
        model.id,
        model.scheduleInfo.startTimestamp,
        model.scheduleInfo.endTimestamp,
        model.classReview,
      );

      // model should have same tutor's id and start time
      for (HistoryScheduleGroup group in generatedList) {
        if (!group.equalToHistory(model)) continue;

        canBeAdded = group.tryAdd(scheduleTime);

        if (canBeAdded) break;
      }

      //Create new group if can't add the time to any previous groups
      if (!canBeAdded) {
        generatedList.add(
          HistoryScheduleGroup.fromElement(
              scheduleTime,
              DateTime.fromMillisecondsSinceEpoch(
                  model.scheduleInfo.endTimestamp),
              model.scheduleInfo.tutorInfo,
              model.studentRequest,
              model.recordUrl),
        );
      }
    }

    List<HistoryScheduleGroup> result = [];

    for (HistoryScheduleGroup group in generatedList) {
      final splitted = group.split(const Duration(minutes: 5, seconds: 1));
      result.addAll(splitted);
    }

    return result;
  }
}
