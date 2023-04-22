import 'package:flutter/material.dart';
import 'package:online_english/utils/theme/my_theme.dart';

class MyDropDownWidget<T> extends StatefulWidget {
  const MyDropDownWidget(
      {Key? key,
      this.hint = "Choose an option",
      required this.dataList,
      this.choosenIndex,
      this.onValueChanged,
      this.minWidth = 100})
      : super(key: key);
  final String hint;
  final void Function(int? index)? onValueChanged;
  final int? choosenIndex;
  final List<T> dataList;
  final double minWidth;
  @override
  MyDropDownWidgetState<MyDropDownWidget<T>, T> createState() =>
      MyDropDownWidgetState<MyDropDownWidget<T>, T>();
}

class MyDropDownWidgetState<TWidget extends MyDropDownWidget<T>, T>
    extends State<TWidget> {
  T? choosenValue;
  bool get isChosen => choosenValue != null;
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
  static TextStyle chosenTextStyleInMenu =
      TextStyle(color: MyTheme.colors.secondaryColor);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initValue(widget.choosenIndex);
  }

  void _initValue(int? index) {
    choosenValue = index == null ? null : widget.dataList[index];
  }

  void onChangeValue(T? value) {
    if (value == null) return;

    int index = widget.dataList.indexOf(value);
    if (widget.onValueChanged != null) {
      widget.onValueChanged!(index);
    }
    setState(() {
      choosenValue = value;
    });
  }

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
          child: SizedBox(
            width: widget.minWidth,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<T>(
                    borderRadius: BorderRadius.circular(12),
                    underline: Container(), //remove underline
                    value: choosenValue,
                    selectedItemBuilder: (context) => widget.dataList
                        .map<Widget>((T item) => Container(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  item.toString(),
                                  style: isChosen
                                      ? chosenTextStyle
                                      : notChosenTextStyle,
                                ),
                              ),
                            ))
                        .toList(),
                    focusColor: Colors.transparent,
                    hint: Text(widget.hint),
                    items: widget.dataList.map<DropdownMenuItem<T>>((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            e.toString(),
                            style: choosenValue == e
                                ? chosenTextStyleInMenu
                                : notChosenTextStyle,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChangeValue,
                    iconEnabledColor: isChosen
                        ? MyTheme.colors.onSecondaryColor
                        : MyTheme.colors.primaryColor,
                    iconSize: 32,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
