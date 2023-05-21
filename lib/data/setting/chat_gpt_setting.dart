part of 'settings.dart';

@JsonSerializable()
class ChatGPTSetting implements ISavable {
  late User _user;
  User get user => _user;

  late User _bot;
  User get bot => _bot;

  late bool autoTTS;
  late List<Message> cacheMessages;

  final String _filePath = "chat_gpt_setting.json";

  ChatGPTSetting._create() {
    cacheMessages = [];
    autoTTS = false;
    _user = User(id: AppSetting.uuidGenerator.v4());
    _bot = User(id: AppSetting.uuidGenerator.v4());
  }
  ChatGPTSetting._(this._user, this._bot, this.cacheMessages, this.autoTTS);

  void newConversation() => cacheMessages = [];
  String getToken() =>
      AppSetting.instance.dotEnv.env[EnvKeyConsts.chatGPTAPIKey] ?? '{}';

  @override
  Future getData(PathProviderIO fileIO) async {
    Map<String, dynamic>? map =
        await fileIO.read<Map<String, dynamic>?>(_filePath);
    if (map == null) return;

    ChatGPTSetting loadedSetting = ChatGPTSetting.fromJson(map);

    _user = loadedSetting.user;
    _bot = loadedSetting.bot;
    autoTTS = loadedSetting.autoTTS;
    cacheMessages = loadedSetting.cacheMessages;
  }

  @override
  Future writeData(PathProviderIO fileIO) {
    try {
      return fileIO.write(this, _filePath);
    } catch (e) {
      return Future(() => null);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': _user.id,
      'botId': _bot.id,
      'cacheMessages': cacheMessages,
      'autoTTS': autoTTS
    };
  }

  factory ChatGPTSetting.fromJson(Map<String, dynamic> map) {
    final user = User(id: map['userId']);
    final bot = User(id: map['botId']);
    return ChatGPTSetting._(
        user,
        bot,
        (map['cacheMessages'] as List).map((e) => Message.fromJson(e)).toList(),
        map['autoTTS']);
  }
}
