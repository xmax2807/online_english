import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/complex_search_component.dart';

import '../shared_components/my_drop_down.dart';
import 'components/teacher_card.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({super.key});

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen>
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
  Widget build(BuildContext context) {
    super.build(context);
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
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 25,
                    separatorBuilder: (ctx, i) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (ctx, i) => TeacherCardWidget(),
                  ),
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
