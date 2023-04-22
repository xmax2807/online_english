import 'package:dio/dio.dart';
import 'package:online_english/data/model/course_model/course_model.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

abstract class ICourseRepository {
  Future<CourseModel> getCourse(String courseId);
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
}
