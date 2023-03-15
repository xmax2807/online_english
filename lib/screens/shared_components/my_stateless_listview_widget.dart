import 'package:flutter/material.dart';

typedef ValueChanged<T> = void Function(T value);
typedef OnBuildWidget<T> = Widget Function(T value);

class MyStatelessListView<T> extends StatelessWidget {
  final ValueChanged<int> onTapItem;
  final OnBuildWidget<int> onBuildWidget;
  final int itemCount;
  final Axis scrollDirection;
  const MyStatelessListView(
      {super.key,
      required this.onTapItem,
      required this.onBuildWidget,
      required this.itemCount,
      this.scrollDirection = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        physics: const BouncingScrollPhysics(),
        scrollDirection: scrollDirection,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: onBuildWidget(i),
              onTap: () => onTapItem(i),
            ),
        separatorBuilder: (ctx, i) => scrollDirection == Axis.horizontal
            ? const SizedBox(
                width: 5,
              )
            : const SizedBox(
                height: 5,
              ),
        itemCount: itemCount);
  }
}
