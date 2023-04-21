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
    if (search.isEmpty) {
      return {
        'filters': filter.toJson(),
        'page': page,
        'perPage': perPage,
      };
    }
    return {
      'filters': filter.toJson(),
      'page': page,
      'perPage': perPage,
      'search': search,
    };
  }

  int getPage() {
    int? result = int.tryParse(page);
    return result ?? 0;
  }
}
