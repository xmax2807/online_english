import 'package:flutter/material.dart';

import 'my_drop_down.dart';

class MyDropDownControlWidget<T> extends MyDropDownWidget<T> {
  const MyDropDownControlWidget(
      {super.key,
      super.hint = "Choose an option",
      required super.dataList,
      super.choosenIndex,
      super.onValueChanged,
      super.minWidth = 100,
      this.onPrevPress,
      this.onNextPress});
  final void Function()? onPrevPress;
  final void Function()? onNextPress;
  @override
  MyDropdownControlWidgetState<T> createState() =>
      MyDropdownControlWidgetState<T>();
}

class MyDropdownControlWidgetState<T>
    extends MyDropDownWidgetState<MyDropDownControlWidget<T>, T> {
  _onPrevTapped() {
    int currentIndex = widget.dataList.indexOf(choosenValue as T);
    widget.onPrevPress?.call();
    onChangeValue(widget.dataList[currentIndex - 1]);
  }

  _onNextTapped() {
    int currentIndex = widget.dataList.indexOf(choosenValue as T);
    widget.onNextPress?.call();
    onChangeValue(widget.dataList[currentIndex + 1]);
  }

  bool isAtStart() =>
      choosenValue == null || widget.dataList.first == choosenValue;
  bool isAtEnd() =>
      choosenValue == null || choosenValue == widget.dataList.last;
  late final List<String> _topicNames;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        IconButton(
            iconSize: 36,
            onPressed: isAtStart() ? null : _onPrevTapped,
            icon: const Icon(Icons.arrow_circle_left_outlined)),
        super.build(context),
        IconButton(
            iconSize: 36,
            onPressed: isAtEnd() ? null : _onNextTapped,
            icon: const Icon(Icons.arrow_circle_right_outlined)),
      ],
    );
  }
}
