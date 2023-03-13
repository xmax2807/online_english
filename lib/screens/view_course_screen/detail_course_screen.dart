import 'package:flutter/material.dart';

import '../shared_components/my_drop_down.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({super.key});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  int currentIndex = 0;
  void onPageChanged(int index) {
    currentIndex = index;
    setState(() {});
  }

  bool isAtStart() => currentIndex == 0;
  bool isAtEnd() => currentIndex == 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 36,
                  onPressed: isAtStart()
                      ? null
                      : () => onPageChanged(currentIndex - 1),
                  icon: const Icon(Icons.arrow_circle_left_outlined)),
              MyDropDownWidget<String>(
                dataList: const ["Topic 1", "Topic 2"],
                hint: "Pick a topic",
                choosenIndex: currentIndex,
                onValueChanged: (int value) => onPageChanged(value),
              ),
              IconButton(
                  iconSize: 36,
                  onPressed:
                      isAtEnd() ? null : () => onPageChanged(currentIndex + 1),
                  icon: const Icon(Icons.arrow_circle_right_outlined)),
            ],
          ),
          const Center(
            child: Text("PDF viewer"),
          )
        ],
      ),
    );
  }
}
