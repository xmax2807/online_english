import 'package:flutter/material.dart';
import 'package:online_english/screens/schedule_screen/on_going_schedule_screen.dart';

import '../../utils/theme/my_theme.dart';
import 'history_schedule_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Ongoing'),
    Tab(text: 'Result'),
  ];
  static const List<Widget> myTabViews = <Widget>[
    InProgressScheduleScreen(),
    LessonResultsScreen(),
  ];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 30,
          title: Text(
            "Schedule",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: MyTheme.colors.onPrimaryColor),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(controller: _tabController, tabs: myTabs),
        ),
        body: Center(
          child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.9,
              child: TabBarView(
                controller: _tabController,
                children: myTabViews,
              )),
        ),
      ),
    );
  }
}
