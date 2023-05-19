import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_type;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:online_english/utils/theme/my_theme.dart';
import 'package:uuid/uuid.dart';

import '../../../services/chat_service.dart';
import '../../../services/speech_to_text_service.dart';
import 'chat_gpt.dart';
import 'text_to_speech.dart';

class MyChatWidget extends ConsumerStatefulWidget {
  const MyChatWidget({super.key});
  @override
  ConsumerState<MyChatWidget> createState() => _MyChatWidgetState();
}

class _MyChatWidgetState extends ConsumerState<MyChatWidget>
    with WidgetsBindingObserver {
  ChatGPTSetting get _chatSetting =>
      AppSetting.instance.userSetting.chatGPTSetting;
  late final MyTTS _textToSpeech;
  late MyChatGPT _chatGPT;

  bool _isReady = false;

  final TextEditingController _messageTextEditController =
      TextEditingController();

  late final ChatService _chatService;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _chatService = ref.read(chatService);

      _textToSpeech = ref.read(textToSpeechService);
      _initMessages();
    });
    _isReady = false;
  }

  void _handleSendPressed(chat_type.PartialText message) async {
    final chat_type.TextMessage textMessage =
        await _createTextMessage(message.text, _chatSetting.user);
    if (mounted) {
      ref.watch(speechToTextService).updateText('');
    }
    await _sendRequest(textMessage);
    _chatService.saveMessages();
  }

  Future _sendRequest(chat_type.TextMessage message) async {
    final List<String>? responses = await _chatGPT.sendRequest(message.text);
    if (responses == null) {
      if (context.mounted) {
        // showAlertDialog(
        //   context,
        //   title: 'Error',
        //   description:
        //       'Request timeout. It seems like the request took longer than 40 sec. Request aborted',
        //   onConfirm: () => _sendRequest(message),
        //   onDecline: () => _removeMessage(message),
        //   confirmText: "Resend Message",
        // );
      }
      return;
    }

    for (var response in responses) {
      await _createTextMessage(response, _chatSetting.bot);
    }
  }

  Future<chat_type.TextMessage> _createTextMessage(
      String text, chat_type.User author) async {
    final textMessage = chat_type.TextMessage(
      author: author,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: text,
    );

    _chatGPT.addToHistory(textMessage);
    _addMessage(textMessage);
    return textMessage;
  }

  List<chat_type.Message> _getMessages() {
    final List<chat_type.Message> messages = ref.read(chatService).messages;
    if (messages.isEmpty) {
      _chatGPT.clearMessages();
    }
    return messages;
  }

  void _addMessage(chat_type.Message message) {
    setState(() {
      _chatSetting.cacheMessages.insert(0, message);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _shouldSpeak(message));
  }

  void _removeMessage(chat_type.Message message) {
    int index = 0;
    for (var element in _chatSetting.cacheMessages) {
      if (element.id == message.id) {
        break;
      }
      index++;
    }
    setState(() {
      _chatSetting.cacheMessages.removeAt(index);
    });
  }

  void _initMessages() async {
    await _chatService.loadMessages();
    _chatGPT = await MyChatGPT.create(_chatService.messages);

    _isReady = true;
    setState(() {});
  }

  void _shouldSpeak(chat_type.Message lastMessage) {
    bool shouldSpeak =
        _chatSetting.autoTTS && _chatSetting.cacheMessages.isNotEmpty;
    if (!shouldSpeak) return;

    if (lastMessage.author.id == _chatSetting.user.id ||
        lastMessage is! chat_type.TextMessage) return;

    _textToSpeech.speak(lastMessage.text, lastMessage.id);
  }

  Widget _getIconState(TtsState state) {
    switch (state) {
      case TtsState.stopped:
        return const Icon(Icons.play_circle_outline_rounded);
      case TtsState.playing:
        return const Icon(Icons.stop_circle_outlined);
      case TtsState.loading:
        // TODO: Handle this case.
        break;
      case TtsState.paused:
        // TODO: Handle this case.
        break;
      case TtsState.continued:
        // TODO: Handle this case.
        break;
    }
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2.0),
      child: CircularProgressIndicator(
        color: MyTheme.colors.primaryColor,
        strokeWidth: 2,
      ),
    );
  }

  Widget _bubbleBuilder(
    Widget child, {
    required chat_type.Message message,
    required nextMessageInGroup,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Bubble(
            padding: const BubbleEdges.only(top: 0, bottom: 0),
            radius: const Radius.circular(30),
            color: _chatService.isUser(message.author)
                ? MyTheme.colors.secondaryColor
                : MyTheme.colors.lightGray,
            child: child,
          ),
        ),
        if (!_chatService.isUser(message.author) &&
            message is chat_type.TextMessage)
          Consumer(builder: (context, ref, child) {
            MessageSpeechState? speechState =
                ref.watch(textToSpeechService).getSpeechState(message.id);

            TtsState currentState = speechState == null
                ? TtsState.stopped
                : speechState.currentState;

            return IconButton(
                onPressed: () {
                  ref.read(textToSpeechService).speak(message.text, message.id);
                },
                icon: _getIconState(currentState));
          }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return !_isReady
        ? const Text("Initializing Messages")
        : Chat(
            bubbleBuilder: _bubbleBuilder,
            messages: _getMessages(),
            onSendPressed: _handleSendPressed,
            user: _chatSetting.user,
            customBottomWidget: Consumer(
              builder: (context, ref, child) {
                _messageTextEditController.text =
                    ref.watch(speechToTextService).speechResult;
                return Input(
                  onSendPressed: _handleSendPressed,
                  options: InputOptions(
                      textEditingController: _messageTextEditController),
                );
              },
            ),

            // inputOptions: InputOptions(
            //     textEditingController: _messageTextEditController),
          );
  }
}
