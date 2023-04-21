import 'package:flutter/material.dart';

class MySearchWidget extends StatefulWidget {
  final List<Widget> filters;
  final String hintSearch;
  final void Function(String)? onSearchClick;
  const MySearchWidget(
      {super.key,
      required this.filters,
      required this.hintSearch,
      required this.onSearchClick});

  @override
  State<StatefulWidget> createState() => SearchWidgetState();
}

class SearchWidgetState extends State<MySearchWidget> {
  List<Widget> get filters => widget.filters;
  String? choosenValue;
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.hintSearch,
                contentPadding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    if (widget.onSearchClick != null) {
                      widget.onSearchClick!(searchController.text);
                    }
                  },
                ),
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
