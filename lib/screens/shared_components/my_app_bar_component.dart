import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MyAppBar extends StatefulWidget {
  final List<Widget> tabWidgets;
  final List<String> tabLabels;
  final ImageProvider<Object>? appbarImage;

  const MyAppBar(
      {super.key,
      required this.tabWidgets,
      required this.tabLabels,
      this.appbarImage});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: Stack(
              // fill whole appbar
              children: [
                Positioned.fill(
                  child: Image(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    colorBlendMode: BlendMode.modulate,
                    image: Assets.images.loginScreenBG.provider(),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            pinned: true,
            floating: true,
            snap: true,
            forceElevated: innerBoxIsScrolled,
            bottom: widget.tabLabels.isEmpty
                ? null
                : TabBar(
                    tabs: [
                      for (String label in widget.tabLabels)
                        Tab(
                          text: label,
                        )
                    ],
                    controller: _tabController,
                  ),
          ),
        ];
      },
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            controller: _tabController,
            children: [
              for (Widget tabItem in widget.tabWidgets)
                ListView(children: [tabItem])
            ],
          ),
        ),
      ),
    );
  }
}
