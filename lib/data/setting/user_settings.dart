part of 'settings.dart';

class UserSetting implements ISavable<UserSetting> {
  late final ChatGPTSetting chatGPTSetting;
  late final SpeechToTextSetting sttSetting;

  UserSetting._create(Uuid generator) {
    chatGPTSetting = ChatGPTSetting._create(
      user: User(id: generator.v4()),
      bot: User(id: generator.v4()),
    );
    sttSetting = SpeechToTextSetting();
  }

  @override
  Future<UserSetting?> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future writeData() {
    // TODO: implement writeData
    throw UnimplementedError();
  }
}
