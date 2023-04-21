import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/tutor_model/dto/detail_teacher_profile.dart';
import '../data/providers/tutor_detail_provider.dart';
import '../data/repositories/tutor_info_repository.dart';

final tutorDetailServiceProvider = ChangeNotifierProvider(
    (ref) => TutorInfoService(ref.read(tutorInfoProvider)));

class TutorInfoService extends ChangeNotifier {
  final TutorInfoRepository _repository;
  TutorInfoService(this._repository);

  TeacherDetailDTO? get detailInfo => _detailInfo;
  TeacherDetailDTO? _detailInfo;

  Future<void> getTutorDetail(String tutorId) async {
    _detailInfo = await _repository.getDetail(tutorId);
    notifyListeners();
  }
}
