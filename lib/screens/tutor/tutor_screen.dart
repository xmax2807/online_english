import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/shared_components/complex_search_component.dart';

import '../../services/search_tutor_service.dart';
import '../shared_components/my_drop_down.dart';
import 'components/teacher_card.dart';

class TutorScreen extends ConsumerStatefulWidget {
  const TutorScreen({super.key});

  @override
  ConsumerState<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends ConsumerState<TutorScreen>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> filters = [
    MyDropDownWidget<DateTime>(
      hint: "Pick a Date",
      dataList: [
        DateTime.now(),
        DateTime.now().subtract(const Duration(days: 1))
      ],
    ),
    MyDropDownWidget<String>(
      hint: "Choose a Nationality",
      dataList: const [
        "VietNam",
        "England",
        "Others",
      ],
    ),
    MyDropDownWidget<String>(hint: "Choose lesson type", dataList: const [
      "English for kids",
      "English for bussiness",
      "IELTS",
      "TOEFL"
    ]),
    TextButton.icon(
      onPressed: null,
      label: const Text("Clear Filter"),
      icon: const Icon(Icons.clear_rounded),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(tutorSearchServiceProvider).getList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final listTutor = ref.watch(tutorSearchServiceProvider).listTutor;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Search a Tutor",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                MySearchWidget(filters: filters, hintSearch: "Search a tutor"),
                Consumer(
                  builder: (ctx, widget, _) {
                    final listTutor =
                        widget.watch(tutorSearchServiceProvider).listTutor;
                    return Expanded(
                      child: listTutor == null || listTutor.isEmpty
                          ? const Text('empty')
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: listTutor.length,
                              separatorBuilder: (ctx, i) => const SizedBox(
                                height: 10,
                              ),
                              itemBuilder: (ctx, i) =>
                                  TeacherCardWidget(dto: listTutor[i]),
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
