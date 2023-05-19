import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class MyAppBar extends StatefulWidget {
  final List<Widget> tabWidgets;
  final List<String> tabLabels;
  final String title;
  final String? subTitle;
  final String? appbarImageUrl;

  const MyAppBar(
      {super.key,
      required this.tabWidgets,
      required this.tabLabels,
      this.appbarImageUrl,
      required this.title,
      this.subTitle});

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
            title: Text(
              widget.title,
              style: context.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            expandedHeight: 200,
            flexibleSpace: Stack(
              // fill whole appbar
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    colorBlendMode: BlendMode.modulate,
                    imageUrl: widget.appbarImageUrl ??
                        Assets.images.loginScreenBG.path,
                    fit: BoxFit.cover,
                  ),
                ),
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
