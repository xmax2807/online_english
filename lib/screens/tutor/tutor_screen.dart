import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/shared_components/complex_search_component.dart';
import 'package:online_english/screens/shared_components/upcoming_schedule_widget.dart';
import 'package:online_english/screens/tutor/tutor_detail_screen.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../services/search_tutor_service.dart';
import '../shared_components/empty_data.dart';
import '../shared_components/my_drop_down.dart';
import 'components/teacher_card.dart';

class TutorScreen extends ConsumerStatefulWidget {
  const TutorScreen({super.key});

  @override
  ConsumerState<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends ConsumerState<TutorScreen>
    with AutomaticKeepAliveClientMixin {
  final nationalities = const [
    "VietNam",
    "England",
    "Others",
  ];

  late final TutorSearchService _searchService;

  void _handleSearchClick(String text) {
    _searchService.searchDTO.search = text;
    _searchService.searchTutors();
  }

  void _onNationalityChanged(int? value) {
    if (value == null) return;
    if (value == 2) {
      _searchService.searchDTO.filter.nationality.isOther();
      _searchService.searchTutors();
      return;
    }
    _searchService.searchDTO.filter.nationality.isVietNamese =
        value == 0 ? true : null;
    _searchService.searchDTO.filter.nationality.isNative =
        value == 1 ? true : null;

    _searchService.searchTutors();
  }

  void _onItemTapped(int i) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TutorDetailScreen(
                tutorId: _searchService.listTutor![i].userId,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchService = ref.read(tutorSearchServiceProvider);
    _searchService.getRecommendList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const UpcomingLessonWidget(),
                const Divider(),
                Text(
                  "Search a Tutor",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer(builder: (ctx, ref, _) {
                  final TextEditingController searchController =
                      ref.watch(tutorSearchServiceProvider).searchController;
                  final bool hasFiltered =
                      ref.watch(tutorSearchServiceProvider).hasFiltered;
                  final int? nationalityIndex =
                      ref.watch(tutorSearchServiceProvider).nationalityIndex();

                  return MySearchWidget(
                    searchController: searchController,
                    hintSearch: "Search a tutor",
                    onSearchClick: _handleSearchClick,
                    filters: [
                      TextButton.icon(
                        style: MyTheme.errorTextOnlyStyle,
                        onPressed:
                            hasFiltered ? _searchService.resetFilter : null,
                        label: const Text("Clear Filter"),
                        icon: const Icon(Icons.clear_rounded),
                      ),
                      MyDropDownWidget<String>(
                        hint: "Nationality",
                        dataList: nationalities,
                        choosenIndex: nationalityIndex,
                        isForceChangeValue: true,
                        onValueChanged: _onNationalityChanged,
                      ),
                      const MyDropDownWidget<String>(
                        hint: "Specialties",
                        minWidth: 150,
                        dataList: [
                          "English for kids",
                          "English for bussiness",
                          "IELTS",
                          "TOEFL"
                        ],
                      ),
                    ],
                  );
                }),
                Consumer(
                  builder: (ctx, widget, _) {
                    final listTutor =
                        widget.watch(tutorSearchServiceProvider).listTutor;
                    if (listTutor == null) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                    return Expanded(
                      child: listTutor.isEmpty
                          ? const EmptyDataWidget()
                          : ListView.separated(
                              controller: _searchService.scrollController,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: listTutor.length,
                              separatorBuilder: (ctx, i) => const SizedBox(
                                height: 10,
                              ),
                              itemBuilder: (ctx, i) => TeacherCardWidget(
                                dto: listTutor[i],
                                onTap: () => _onItemTapped(i),
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
