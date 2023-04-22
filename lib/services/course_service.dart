import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/course_model/course_model.dart';
import '../data/providers/course_repos_provider.dart';
import '../data/repositories/course_repository.dart';

final courseServiceProvider = ChangeNotifierProvider.autoDispose(
    (ref) => CourseService(ref.read(courseRepositoryProvider)));

class CourseService extends ChangeNotifier {
  final CourseRepository _repository;
  CourseService(this._repository);

  CourseModel? _currentViewCourse;
  CourseModel? get currentViewCourse => _currentViewCourse;
  Future<void> getCourseDetail(String courseId) async {
    _currentViewCourse = await _repository.getCourse(courseId);
    notifyListeners();
  }
}
