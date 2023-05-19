import 'dart:ui';

import 'package:flutter/material.dart';

import 'components/my_chat_widget.dart';
import 'components/speech_to_text_widget.dart';

class ChatGPTScreen extends StatelessWidget {
  const ChatGPTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI'),
      ),
      body: Center(
        child: SizedBox(
          width: window.physicalSize.width,
          height: window.physicalSize.height,
          child: Column(
            children: const <Widget>[
              Flexible(
                child: MyChatWidget(),
              ),
              SpeechToTextWidget()
            ],
          ),
        ),
      ),
    );
  }
}
