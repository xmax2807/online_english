import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/filter_model/teacher_filter/teacher_search.dart';
import 'package:online_english/data/model/tutor_model/dto/overview_teacher_profile.dart';
import 'package:online_english/data/providers/tutor_search_provider.dart';
import 'package:online_english/data/repositories/tutor_search_repository.dart';
import 'dart:developer' as dev;

final tutorSearchServiceProvider = ChangeNotifierProvider(
    (ref) => TutorSearchService(ref.read(tutorSearchProvider)));

class TutorSearchService extends ChangeNotifier {
  final TutorSearchRepository _repository;
  late TeacherSearchDTO _searchDTO;
  TeacherSearchDTO get searchDTO => _searchDTO;

  late final TextEditingController searchController;

  bool get hasFiltered => searchDTO.hasFiltered;
  void resetFilter() {
    searchDTO.reset();
    searchController.text = '';
    getRecommendList();
  }

  int? nationalityIndex() => _searchDTO.filter.nationality.getFilterIndex();

  List<TeacherOverviewDTO>? _cache;
  List<TeacherOverviewDTO>? _listTutor;
  List<TeacherOverviewDTO>? get listTutor => _listTutor;
  int get listCount => _listTutor == null ? 0 : _listTutor!.length;
  bool get hasData => _listTutor != null && _listTutor!.isNotEmpty;

  TutorSearchService(this._repository) {
    _searchDTO = TeacherSearchDTO();
    searchController = TextEditingController(text: _searchDTO.search);
  }

  int _mapComparer<T extends Comparable>(
      Map<String, dynamic> a, Map<String, dynamic> b, String field) {
    T? val1 = a[field] as T?;
    T? val2 = b[field] as T?;
    if (val1 is num && val2 is num) {
      return val1.toDouble().compareTo(val2.toDouble());
    }
    if (val1 == null && val2 == null) return 0;
    if (val1 == null) return -1;
    if (val2 == null) return 1;
    return (val1.compareTo(val2));
  }

  int _inListComparer<T>(
      List<dynamic> list, bool Function(dynamic, dynamic) callback, T a, T b) {
    dynamic isA =
        list.firstWhere((ele) => callback.call(ele, a), orElse: () => null);
    dynamic isB =
        list.firstWhere((ele) => callback.call(ele, b), orElse: () => null);
    bool isContainA = isA != null;
    bool isContainB = isB != null;

    if (isContainA == isContainB) return 0;
    return isContainA ? 1 : -1;
  }

  Future<void> getList() async {
    var result = await _repository.searchATutor(_searchDTO);

    if (result != null) {
      _listTutor = result;
    }
    notifyListeners();
  }

  Future<void> getRecommendList() async {
    if (_cache == null) {
      await initList();
      if (_cache == null) {
        return;
      }
    }

    int start = (_searchDTO.getPage() - 1) * _searchDTO.perPage;
    dev.log(start.toString());
    dev.log(_cache!.length.toString());
    _listTutor = _cache!.getRange(start, start + _searchDTO.perPage).toList();
    notifyListeners();
  }

  Future<void> initList() async {
    var result = await _repository.getAll(1000, '1');
    if (result == null) return;

    var tutors = result['tutors']['rows'] as List<dynamic>;
    var favTutors = result['favoriteTutor'] as List<dynamic>;
    tutors.sort((a, b) {
      int inList = _inListComparer(
          favTutors, (ele, val) => ele['secondId'] == val['userId'], b, a);
      return inList == 0 ? _mapComparer(b, a, 'rating') : inList;
    });

    _cache = tutors.map((e) {
      dynamic isfavTutor = favTutors
          .firstWhereOrNull((element) => element['secondId'] == e['userId']);
      e['isfavoritetutor'] = isfavTutor != null ? '1' : null;
      return TeacherOverviewDTO.fromJson(e);
    }).toList();
  }

  Future<void> searchTutors() async {
    var result = await _repository.searchATutor(_searchDTO);

    if (result != null) {
      _listTutor = result;
    }
    notifyListeners();
  }
}
