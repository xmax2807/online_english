import 'dart:async';
import 'dart:collection';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/setting/settings.dart';

enum TtsState { playing, stopped, loading, paused, continued }

class MessageSpeechState {
  TtsState currentState;
  String messageId;
  MessageSpeechState({required this.currentState, required this.messageId});
}

final textToSpeechService = ChangeNotifierProvider(
  (ref) => MyTTS(),
);

class MyTTS extends ChangeNotifier {
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  SpeechToTextSetting get _settingData =>
      AppSetting.instance.userSetting.sttSetting;
  late final Queue<MessageSpeechState> queue;

  //Constructor
  MyTTS() {
    flutterTts = FlutterTts();
    queue = Queue<MessageSpeechState>();
    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      //_getDefaultVoice();
    }
  }
  MessageSpeechState? getSpeechState(String messageId) {
    try {
      return queue.firstWhere((element) => element.messageId == messageId);
    } catch (e) {
      return null;
    }
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future<dynamic> getDefaultVoice() async {
    return await flutterTts.getDefaultVoice;
  }

  Future _waitWhile(bool Function() test,
      [Duration pollInterval = Duration.zero]) {
    var completer = Completer();
    check() {
      if (!test()) {
        completer.complete();
      } else {
        Timer(pollInterval, check);
      }
    }

    check();
    return completer.future;
  }

  Future speak(String text, String messageId) async {
    // push speech execution to queue
    queue.addLast(MessageSpeechState(
        currentState: TtsState.loading, messageId: messageId));
    notifyListeners();
    // setting up the incoming speech before executing
    // create list of tasks
    final List<Future> readyTasks = [];

    // add waiting task which will wait until the current speech is completed
    readyTasks.add(_waitWhile(() => !isStopped));

    // add setup tasks.
    if (!isWindows) {
      final setLanguageTask = flutterTts.setLanguage(
          _settingData.currentSpeechLocaleName?.localeId.replaceAll('_', '-') ??
              ''); //flutterTts.getDefaultVoice);
      readyTasks.add(setLanguageTask);
    }

    readyTasks.add(flutterTts.setVolume(volume));
    readyTasks.add(flutterTts.setSpeechRate(rate));
    readyTasks.add(flutterTts.setPitch(pitch));

    // wait all the tasks.
    await Future.wait(readyTasks);

    // if the state is stopped (no speech is executing)
    // change current speech state to playing state and notify to update UI
    queue.first.currentState = TtsState.playing;
    notifyListeners();

    if (text.isNotEmpty) {
      ttsState = TtsState.playing;
      await flutterTts.speak(text);
      ttsState = TtsState.stopped;
    }

    //After the speech is done
    // set to stopped state
    // remove from the queue
    // finally, update the UI
    queue.first.currentState = TtsState.stopped;
    queue.removeFirst();
    notifyListeners();
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future stop() async {
    await flutterTts.stop();
  }

  Future pause() async {
    var result = await flutterTts.pause();
  }

  void destroyTTS() {
    flutterTts.stop();
  }
}
