import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_type;

import '../utils/io/path_provider_io.dart';

final chatService = ChangeNotifierProvider(
    (ref) => ChatService(fileIO: JsonPathProvider<ChatGPTSetting>()));

class ChatService extends ChangeNotifier {
  ChatGPTSetting get _chatSetting =>
      AppSetting.instance.userSetting.chatGPTSetting;

  bool get autoTTS => _chatSetting.autoTTS;

  get messages => _chatSetting.cacheMessages;
  final JsonPathProvider<ChatGPTSetting> fileIO;

  ChatService({required this.fileIO});

  // void changeSpeechLanguage(LocaleName? locale) {
  //   _chatSetting.speechLanguage = locale;
  //   notifyListeners();
  //   _chatSetting.saveSetting();
  // }
  bool isUser(chat_type.User user) => _chatSetting.user.id == user.id;

  void deleteMessages() {
    _chatSetting.newConversation();
    notifyListeners();
    saveMessages();
  }

  Future<dynamic> loadMessages() async {
    // final messages = await readJsonList(
    //   MyGlobalStorage.messagePath,
    //   onMapping: (map) => chat_type.Message.fromJson(map),
    // );

    // _chatSetting.cacheMessages = messages ?? [];

    // return MyGlobalStorage.messages;
  }

  void saveMessages() {
    //fileIO.write(messages, MyGlobalStorage.messagePath);
  }
}
