import 'package:dio/dio.dart';
import 'package:online_english/data/model/course_model/course_model.dart';
import 'package:online_english/data/model/course_model/dto/course_basic_dto.dart';
import 'package:online_english/data/model/filter_model/course_filter/course_filter.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

import 'dart:developer' as dev;

abstract class ICourseRepository {
  Future<CourseModel> getCourse(String courseId);
  Future<List<CourseBasicDTO>> getCourses(CourseFilter filter);
}

class CourseRepository implements ICourseRepository {
  final Dio _dio;

  CourseRepository(this._dio);
  @override
  Future<CourseModel> getCourse(String courseId) {
    return _dio
        .get('${ApiKeys.courseDetail}$courseId')
        .then((response) => CourseModel.fromJson(response.data!['data']));
  }

  @override
  Future<List<CourseBasicDTO>> getCourses(CourseFilter filter) {
    final stopwatch = Stopwatch()..start();
    return _dio
        .get(
      ApiKeys.listCourse,
      queryParameters: filter.toJson(),
    )
        .then((value) {
      dev.log(stopwatch.elapsed.toString());
      stopwatch.stop();

      List result = value.data!['data']['rows'] as List;
      var listData = result.map((row) {
        row['courseLength'] = (row['topics'] as List).length;
        return CourseBasicDTO.fromJson(row);
      }).toList();
      stopwatch.stop();
      dev.log(stopwatch.elapsed.toString());
      return listData;
    });
  }
}
