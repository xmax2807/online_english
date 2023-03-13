import 'package:flutter/material.dart';
import 'package:online_english/utils/theme/my_theme.dart';

class MyDropDownWidget<T> extends StatefulWidget {
  MyDropDownWidget(
      {Key? key,
      this.hint = "Choose an option",
      required this.dataList,
      this.choosenIndex,
      this.onValueChanged})
      : super(key: key);
  final String hint;
  final void Function(int value)? onValueChanged;
  int? choosenIndex;
  final List<T> dataList;
  @override
  _MyDropDownWidgetState<T> createState() => _MyDropDownWidgetState<T>();
}

class _MyDropDownWidgetState<T> extends State<MyDropDownWidget<T>> {
  T? get choosenValue => widget.choosenIndex == null
      ? null
      : widget.dataList[widget.choosenIndex!];
  bool get isChosen => widget.choosenIndex != null;
  static BoxDecoration notChosen = BoxDecoration(
    border: Border.all(color: MyTheme.colors.primaryColor),
    borderRadius: BorderRadius.circular(1000),
  );
  static BoxDecoration chosen = BoxDecoration(
    color: MyTheme.colors.secondaryColor,
    borderRadius: BorderRadius.circular(1000),
  );

  static TextStyle notChosenTextStyle =
      TextStyle(color: MyTheme.colors.primaryColor);
  static TextStyle chosenTextStyle =
      TextStyle(color: MyTheme.colors.onSecondaryColor);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: isChosen ? chosen : notChosen,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 12),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: DropdownButton<T>(
            borderRadius: BorderRadius.circular(12),
            underline: Container(), //remove underline
            value: choosenValue,
            selectedItemBuilder: (context) => widget.dataList
                .map<Widget>((T item) => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        item.toString(),
                        style: isChosen ? chosenTextStyle : notChosenTextStyle,
                      ),
                    ))
                .toList(),
            focusColor: Colors.transparent,
            hint: Text(widget.hint),
            items: widget.dataList.map<DropdownMenuItem<T>>((e) {
              return DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      e.toString(),
                      style: notChosenTextStyle,
                    ),
                  ));
            }).toList(),
            onChanged: (T? value) {
              setState(() {
                widget.choosenIndex = widget.dataList.indexOf(value as T);
              });
              widget.onValueChanged!(widget.choosenIndex!);
            },
            iconEnabledColor: isChosen
                ? MyTheme.colors.onSecondaryColor
                : MyTheme.colors.primaryColor,
            iconSize: 32,
          ),
        ),
      ),
    );
  }
}
