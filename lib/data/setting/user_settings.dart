part of 'settings.dart';

class UserSetting implements ISavable {
  late final ChatGPTSetting chatGPTSetting;
  late final SpeechToTextSetting sttSetting;

  UserSetting._create() {
    chatGPTSetting = ChatGPTSetting._create();
    sttSetting = SpeechToTextSetting();
  }

  @override
  Future getData(PathProviderIO fileIO) {
    List<Future> tasks = [];
    tasks.add(chatGPTSetting.getData(fileIO));
    tasks.add(sttSetting.getData(fileIO));

    return Future.wait(tasks);
  }

  @override
  Future writeData(PathProviderIO fileIO) {
    List<Future> tasks = [];
    tasks.add(chatGPTSetting.writeData(fileIO));
    tasks.add(sttSetting.writeData(fileIO));

    return Future.wait(tasks);
  }
}
