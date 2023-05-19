part of 'settings.dart';

class ChatGPTSetting {
  final User user;
  final User bot;
  late bool autoTTS;
  late final List<Message> cacheMessages;
  ChatGPTSetting._create({required this.user, required this.bot}) {
    cacheMessages = [];
    autoTTS = false;
  }

  void newConversation() => cacheMessages = [];
  String getToken() =>
      AppSetting.instance.dotEnv.env[EnvKeyConsts.chatGPTAPIKey] ?? '{}';
}
