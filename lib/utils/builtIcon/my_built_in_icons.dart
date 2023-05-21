import 'package:flutter/material.dart';

class IconText {
  IconData icon;
  String label;
  IconText(this.icon, this.label);
}

class MyBuiltInIcons {
  static IconText tutor = IconText(Icons.person_search, "Tutor");
  static IconText schedule = IconText(Icons.calendar_month_sharp, "Schedule");
  static IconText course = IconText(Icons.book_rounded, "Course");
  static IconText profile = IconText(Icons.account_circle, "Profile");
  static IconText chatGPT = IconText(Icons.api_rounded, "Chat AI");
}
