import 'filter_teacher_model.dart';

class TeacherSearchDTO {
  late FilterModel filter;
  late String page;
  late int perPage;
  late String search;

  TeacherSearchDTO() {
    filter = FilterModel();
    page = "1";
    perPage = 10;
    search = "";
  }

  Map<String, dynamic> toJson() {
    return {
      'filters': filter.toJson(),
      'page': page,
      'perPage': perPage,
      'search': search,
    };
  }
}
