import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/course_model/category_model/category_model.dart';
import 'package:online_english/data/model/course_model/dto/course_basic_dto.dart';
import 'package:online_english/data/model/filter_model/course_filter/course_filter.dart';

import '../data/model/course_model/course_model.dart';
import '../data/providers/course_repos_provider.dart';
import '../data/repositories/course_repository.dart';

final courseServiceProvider = ChangeNotifierProvider.autoDispose(
    (ref) => CourseService(ref.read(courseRepositoryProvider)));

class CourseService extends ChangeNotifier {
  final CourseRepository _repository;
  CourseService(this._repository) {
    _filter = CourseFilter();
    _cache = {};
    _categories = [];
    searchController = TextEditingController(text: _filter.search);
  }

  CourseModel? _currentViewCourse;
  CourseModel? get currentViewCourse => _currentViewCourse;
  Future<void> getCourseDetail(String courseId) async {
    _currentViewCourse = await _repository.getCourse(courseId);
    notifyListeners();
  }

  late Map<CategoryModel, List<CourseBasicDTO>> _cache;

  late List<CategoryModel> _categories;
  List<CategoryModel> get categories => _categories;

  late CourseFilter _filter;
  CourseFilter get filter => _filter;
  late final TextEditingController searchController;

  bool get hasData => _cache.isNotEmpty;

  bool _waiting = false;
  bool get waiting => _waiting;

  Future<void> getListCourse() async {
    _waiting = true;

    final result = await _repository.getCourses(filter);
    _initData(result);
    _fetchCategories();
    _waiting = false;
    notifyListeners();
  }

  void _fetchCategories() {
    for (var key in _cache.keys) {
      if (!_categories.contains(key)) {
        _categories.add(key);
      }
    }
  }

  void _initData(List<CourseBasicDTO> data) {
    _clearCache();

    for (CourseBasicDTO element in data) {
      for (CategoryModel category in element.categories) {
        if (_cache.containsKey(category) == false) {
          _cache[category] = [element];
        } else {
          _cache[category]!.add(element);
        }
      }
    }
  }

  void _clearCache() {
    _cache = {};
    notifyListeners();
  }

  void resetFilter() {
    _filter.reset();
    searchController.text = '';
    getListCourse();
    notifyListeners();
  }

  List<CourseBasicDTO>? getCourseInCache(CategoryModel categoryModel) {
    return _cache[categoryModel];
  }
}
