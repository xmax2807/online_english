import 'package:online_english/data/model/filter_model/filter_interface.dart';

import 'filter_teacher_model.dart';

class TeacherSearchDTO implements IFilter {
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

  @override
  // TODO: implement hasFiltered
  bool get hasFiltered => search.isNotEmpty || filter.hasFiltered;

  @override
  void reset() {
    search = '';
    filter.reset();
  }
}
