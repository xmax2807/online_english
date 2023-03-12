import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/my_drop_down.dart';

class MySearchWidget extends StatefulWidget {
  const MySearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => SearchWidgetState();
}

class SearchWidgetState extends State<MySearchWidget> {
  final List<Widget> filters = [
    MyDropDownWidget<DateTime>(
      hint: "Pick a Date",
      dataList: [
        DateTime.now(),
        DateTime.now().subtract(const Duration(days: 1))
      ],
    ),
    const MyDropDownWidget<String>(
      hint: "Choose a Nationality",
      dataList: [
        "VietNam",
        "England",
        "Others",
      ],
    ),
    const MyDropDownWidget<String>(hint: "Choose lesson type", dataList: [
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
  String? choosenValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: "Search a Teacher",
              contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: null,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => filters[i],
              itemCount: filters.length,
              separatorBuilder: (ctx, i) => const SizedBox(
                width: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
