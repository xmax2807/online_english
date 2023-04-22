import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../data/model/course_model/course_model.dart';
import '../shared_components/my_drop_down_with_controller.dart';

class CourseTopicsScreen extends StatefulWidget {
  final CourseModel data;
  const CourseTopicsScreen({super.key, required this.data});

  @override
  State<CourseTopicsScreen> createState() => _CourseTopicsScreenState();
}

class _CourseTopicsScreenState extends State<CourseTopicsScreen> {
  int currentIndex = 0;
  void onPageChanged(int? index) {
    if (index == null) return;

    setState(() {
      currentIndex = index;
    });
  }

  bool isAtStart() => currentIndex == 0;
  bool isAtEnd() => currentIndex == widget.data.topics.length - 1;
  late final List<String> _topicNames;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topicNames = widget.data.topics.map((e) => e.name).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyDropDownControlWidget(
                dataList: _topicNames,
                hint: "Pick a topic",
                choosenIndex: currentIndex,
                onValueChanged: onPageChanged,
                minWidth: 200,
                onPrevPress: () => onPageChanged(currentIndex - 1),
                onNextPress: () => onPageChanged(currentIndex + 1),
              ),
              // IconButton(
              //     iconSize: 36,
              //     onPressed: isAtStart()
              //         ? null
              //         : () => onPageChanged(currentIndex - 1),
              //     icon: const Icon(Icons.arrow_circle_left_outlined)),
              // MyDropDownWidget<String>(
              //   dataList: _topicNames,
              //   hint: "Pick a topic",
              //   choosenIndex: currentIndex,
              //   onValueChanged: onPageChanged,
              //   minWidth: 200,
              // ),
              // IconButton(
              //     iconSize: 36,
              //     onPressed:
              //         isAtEnd() ? null : () => onPageChanged(currentIndex + 1),
              //     icon: const Icon(Icons.arrow_circle_right_outlined)),
            ],
          ),
          SizedBox(
            height: 600,
            child: SfPdfViewer.network(
              widget.data.topics[currentIndex].nameFile,
            ),
          )
        ],
      ),
    );
  }
}
