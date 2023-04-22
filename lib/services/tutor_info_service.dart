import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../data/model/schedule_model/dto/schedule_table_dto.dart';
import '../data/model/tutor_model/dto/detail_teacher_profile.dart';
import '../data/providers/tutor_detail_provider.dart';
import '../data/repositories/tutor_info_repository.dart';
import 'dart:developer' as dev;

final tutorDetailServiceProvider = ChangeNotifierProvider.autoDispose(
    (ref) => TutorInfoService(ref.read(tutorInfoProvider)));

class TutorInfoService extends ChangeNotifier {
  final TutorInfoRepository _repository;
  TutorInfoService(this._repository);
  late FlickManager _flickManager;
  FlickManager get flickManager => _flickManager;
  late VideoPlayerController _controller;
  bool _isVideoAvailable = false;
  bool get isVideoAvailable => _isVideoAvailable;

  TeacherDetailDTO? get detailInfo => _detailInfo;
  TeacherDetailDTO? _detailInfo;

  ScheduleTableDTO? _scheduleTable;
  ScheduleTableDTO? get scheduleTable => _scheduleTable;

  Future<void> getTutorDetail(String tutorId) async {
    _detailInfo = await _repository.getDetail(tutorId);
    dev.log(_detailInfo!.video ?? 'null');
    if (_detailInfo!.video != null) {
      _controller = VideoPlayerController.network(_detailInfo!.video!);
      try {
        await _controller.initialize();
        _flickManager = FlickManager(
            videoPlayerController: _controller, autoInitialize: false);

        _isVideoAvailable = true;
        notifyListeners();
        return;
      } catch (e) {
        dev.log(e.toString());
        _isVideoAvailable = false;
      }
    }
    notifyListeners();
  }

  Future<void> getSchedulesOfTutor(String tutorId) async {
    _scheduleTable = await _repository.getSchedules(tutorId);
    notifyListeners();
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }
}
