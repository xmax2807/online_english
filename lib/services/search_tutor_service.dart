import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/filter_model/teacher_filter/teacher_search.dart';
import 'package:online_english/data/model/tutor_model/dto/overview_teacher_profile.dart';
import 'package:online_english/data/providers/tutor_search_provider.dart';
import 'package:online_english/data/repositories/tutor_search_repository.dart';

final tutorSearchServiceProvider = ChangeNotifierProvider(
    (ref) => TutorSearchService(ref.read(tutorSearchProvider)));

class TutorSearchService extends ChangeNotifier {
  final TutorSearchRepository _repository;
  late TeacherSearchDTO _searchDTO;
  TeacherSearchDTO get searchDTO => _searchDTO;
  TutorSearchService(this._repository) {
    _searchDTO = TeacherSearchDTO();
  }

  List<TeacherOverviewDTO>? _listTutor;
  List<TeacherOverviewDTO>? get listTutor => _listTutor;
  int get listCount => _listTutor == null ? 0 : _listTutor!.length;
  bool get hasData => _listTutor != null && _listTutor!.isNotEmpty;
  Future<void> getList() async {
    var result = await _repository.getListTutor(_searchDTO);

    if (result != null) {
      _listTutor = result;
    }
    notifyListeners();
  }
}
