import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final speechToTextService =
    ChangeNotifierProvider((ref) => SpeechToTextProvider());

class SpeechToTextProvider extends ChangeNotifier {
  String _speechResult = '';

  String get speechResult => _speechResult;

  void updateText(String text) {
    _speechResult = text;
    notifyListeners();
  }
}
