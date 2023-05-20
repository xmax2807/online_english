import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../shared_components/text_tooltip.dart';

class ChatSettingWidget extends ConsumerStatefulWidget {
  const ChatSettingWidget({super.key});
  @override
  ConsumerState<ChatSettingWidget> createState() => _ChatSettingWidgetState();
}

class _ChatSettingWidgetState extends ConsumerState<ChatSettingWidget> {
  UserSetting get _setting => AppSetting.instance.userSetting;

  Widget buildSwitchButton(
      BuildContext context, bool val, Function(bool) toggleButtonClicked) {
    return FlutterSwitch(
        activeColor: Theme.of(context).colorScheme.secondary,
        width: 40,
        height: 20,
        borderRadius: 25.0,
        toggleSize: 15,
        padding: 4.0,
        value: val,
        onToggle: toggleButtonClicked);
  }

  late List<LocaleName> speechLocaleNames;
  late List<DropdownMenuItem<LocaleName>> cacheDropdownItems;

  @override
  void initState() {
    super.initState();
    speechLocaleNames = _setting.sttSetting.speechLocaleNames;
    cacheDropdownItems = speechLocaleNames
        .map((e) => DropdownMenuItem<LocaleName>(
              value: e,
              child: Text(e.name),
            ))
        .toList();
  }

  void onLanaugeSelected(LocaleName? val) {
    setState(() {
      _setting.sttSetting.currentSpeechLocaleName = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWithTooltip(
                      text: "Auto TTS",
                      tooltip: "Auto speak the message for you",
                    ),
                    buildSwitchButton(context, _setting.chatGPTSetting.autoTTS,
                        (val) {
                      setState(() {
                        _setting.chatGPTSetting.autoTTS = val;
                      });
                    }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWithTooltip(
                        text: "Speech Language",
                        tooltip:
                            "Choose a lanaguage to communicate with ChatGPT",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      speechLocaleNames.isEmpty
                          ? const Text("No Langauge supported")
                          : Expanded(
                              child: DropdownButton<LocaleName>(
                                isExpanded: true,
                                onChanged: onLanaugeSelected,
                                value:
                                    _setting.sttSetting.currentSpeechLocaleName,
                                items: cacheDropdownItems,
                                hint: const Text('Select a language'),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
