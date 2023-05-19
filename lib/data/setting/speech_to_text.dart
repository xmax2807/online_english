part of 'settings.dart';

class SpeechToTextSetting {
  late final List<LocaleName> speechLocaleNames;
  late LocaleName? currentSpeechLocaleName;

  SpeechToTextSetting() {
    currentSpeechLocaleName = null;
  }
}
