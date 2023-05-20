import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/chat_gpt_screen/chat_gpt_screen.dart';
import 'package:online_english/screens/course_screen/course_screen.dart';
import 'package:online_english/screens/tutor/tutor_screen.dart';
import 'package:online_english/services/app_setting_service.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../utils/builtIcon/my_built_in_icons.dart';
import '../profile_screen/profile_screen.dart';
import '../schedule_screen/schedule_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  PageController? _pageController;
  int _selectedIndex = 0;
  static List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: Icon(MyBuiltInIcons.tutor.icon),
      label: MyBuiltInIcons.tutor.label,
    ),
    BottomNavigationBarItem(
      icon: Icon(MyBuiltInIcons.schedule.icon),
      label: MyBuiltInIcons.schedule.label,
    ),
    BottomNavigationBarItem(
      icon: Icon(MyBuiltInIcons.course.icon),
      label: MyBuiltInIcons.course.label,
    ),
    BottomNavigationBarItem(
      icon: Icon(MyBuiltInIcons.chatGPT.icon),
      label: MyBuiltInIcons.chatGPT.label,
    ),
    BottomNavigationBarItem(
      icon: Icon(MyBuiltInIcons.profile.icon),
      label: MyBuiltInIcons.profile.label,
    ),
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TutorScreen(),
    ScheduleScreen(),
    CourseScreen(),
    ChatGPTScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController!.jumpToPage(_selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    ref.read(appSettingService).loadEssentialKeyValues();
  }

  @override
  void dispose() {
    _pageController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: navItems,
          unselectedItemColor: MyTheme.colors.primaryColor,
          currentIndex: _selectedIndex,
          selectedItemColor: MyTheme.colors.secondaryColor,
          onTap: _onItemTapped,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        ),
      ),
    );
  }
}
