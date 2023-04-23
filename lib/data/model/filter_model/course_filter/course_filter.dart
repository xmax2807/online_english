import 'package:online_english/data/model/filter_model/filter_interface.dart';

class CourseFilter extends IFilter {
  int page;
  int size;
  late List<int> levels;
  late List<String> categoryIds;
  bool? isSortAscending;
  String search;

  CourseFilter({
    this.page = 1,
    this.size = 100,
    this.isSortAscending,
    this.search = '',
  }) {
    levels = [];
    categoryIds = [];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      'page': page,
      'size': size,
    };

    if (levels.isNotEmpty) {
      result['level[]'] = levels;
    }
    if (categoryIds.isNotEmpty) {
      result['categoryId[]'] = categoryIds;
    }
    if (isSortAscending != null) {
      result['order[]'] = 'level';
      result['orderBy[]'] = isSortAscending! ? 'ASC' : 'DESC';
    }
    if (search.isNotEmpty) {
      result['q'] = search;
    }
    return result;
  }

  @override
  // TODO: implement hasFiltered
  bool get hasFiltered =>
      search.isNotEmpty ||
      levels.isNotEmpty ||
      categoryIds.isNotEmpty ||
      isSortAscending != null;

  @override
  void reset() {
    search = '';
    levels.clear();
    categoryIds.clear();
    isSortAscending = null;
  }
}
