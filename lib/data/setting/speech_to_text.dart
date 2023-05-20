part of 'settings.dart';

class SpeechToTextSetting implements ISavable {
  late List<LocaleName> speechLocaleNames;
  late LocaleName? currentSpeechLocaleName;
  final String _filePath = "stt_setting.json";

  SpeechToTextSetting() {
    currentSpeechLocaleName = null;
  }

  @override
  Future getData(PathProviderIO fileIO) async {
    currentSpeechLocaleName = await fileIO.read<LocaleName?>(_filePath);
  }

  @override
  Future writeData(PathProviderIO fileIO) {
    if (currentSpeechLocaleName == null) return Future(() => null);

    return fileIO.write<LocaleName>(currentSpeechLocaleName!, _filePath);
  }
}
