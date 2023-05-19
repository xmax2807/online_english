import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/course_model/category_model/category_model.dart';
import 'package:online_english/data/model/course_model/dto/course_basic_dto.dart';
import 'package:online_english/data/model/filter_model/course_filter/course_filter.dart';
import 'package:online_english/screens/course_screen/components/lesson_card_component.dart';
import 'package:online_english/screens/shared_components/complex_search_component.dart';
import 'package:online_english/screens/shared_components/empty_data.dart';
import 'package:online_english/screens/shared_components/my_stateless_listview_widget.dart';
import 'package:online_english/screens/view_course_screen/view_course_screen.dart';
import 'package:online_english/services/course_service.dart';

import '../../data/model/course_model/category_model/category_key.dart';
import '../../utils/theme/my_theme.dart';
import '../shared_components/my_drop_down.dart';

class CourseScreen extends ConsumerStatefulWidget {
  const CourseScreen({super.key});

  @override
  ConsumerState<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends ConsumerState<CourseScreen> {
  late final CourseService _service;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = ref.read(courseServiceProvider);
    _service.getListCourse();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Find a course",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Consumer(builder: (ctx, ref, _) {
                  CourseFilter filter = ref.watch(courseServiceProvider).filter;
                  final List<CategoryModel> categories =
                      ref.watch(courseServiceProvider).categories;

                  return MySearchWidget(
                    filters: [
                      TextButton.icon(
                        style: MyTheme.errorTextOnlyStyle,
                        onPressed:
                            filter.hasFiltered ? _service.resetFilter : null,
                        label: const Text("Clear Filter"),
                        icon: const Icon(Icons.clear_rounded),
                      ),
                      MyDropDownWidget<String>(
                        minWidth: 150,
                        hint: "Level",
                        choosenIndex:
                            filter.levels.isEmpty ? null : filter.levels[0],
                        dataList: categoryLevel,
                        onValueChanged: (val) {
                          if (val != null) filter.levels = [val];
                          _service.getListCourse();
                        },
                        isForceChangeValue: true,
                      ),
                      MyDropDownWidget<String>(
                        hint: "Categories",
                        minWidth: 150,
                        dataList: categories.map((e) => e.title).toList(),
                        onValueChanged: (val) {
                          if (val != null) {
                            filter.categoryIds = [categories[val].id];
                          }
                          _service.getListCourse();
                        },
                        choosenIndex: filter.categoryIds.isEmpty
                            ? null
                            : categories.indexWhere((element) =>
                                element.id == filter.categoryIds[0]),
                        isForceChangeValue: true,
                      ),
                      const MyDropDownWidget<String>(
                        hint: "Sort level order",
                        dataList: ["Hardest to Easiest", "Easiest to Hardest"],
                        minWidth: 150,
                      ),
                    ],
                    hintSearch: "Find a course",
                    searchController: _service.searchController,
                    onSearchClick: (val) {
                      filter.search = val;
                      _service.getListCourse();
                    },
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer(builder: (ctx, ref, _) {
                  final categories =
                      ref.watch(courseServiceProvider).categories;

                  if (_service.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (!_service.hasData) {
                    return const EmptyDataWidget();
                  }

                  return Column(
                      children: categories
                          .where((category) =>
                              _service.getCourseInCache(category) != null)
                          .map((category) {
                    List<CourseBasicDTO> courseData =
                        _service.getCourseInCache(category)!;

                    return ListTile(
                      title: Text(
                        category.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: SizedBox.fromSize(
                        size: const Size.fromHeight(250),
                        child: MyStatelessListView(
                            onTapItem: (i) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewCourseScreen(
                                    courseId: courseData[i].id,
                                  ),
                                ),
                              );
                            },
                            onBuildWidget: (int index) =>
                                LessonCardWidget(data: courseData[index]),
                            itemCount: courseData.length,
                            scrollDirection: Axis.horizontal),
                      ),
                    );
                  }).toList());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
