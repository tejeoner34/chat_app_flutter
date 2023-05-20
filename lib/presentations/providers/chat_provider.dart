import 'package:chat_app_flutter/config/helpers/get_yes_no_answer.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_flutter/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  final FocusNode testFocus = FocusNode();
  List<Message> messageList = [
    Message(text: 'Test message', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final messageToAdd = Message(text: text, fromWho: FromWho.me);
    messageList.add(messageToAdd);

    if(text.endsWith('?')) {
      getHerReply();
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> getHerReply() async {
    final reply = await getYesNoAnswer.getAnswer();
    messageList.add(reply);
    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }
}
