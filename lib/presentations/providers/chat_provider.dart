import 'package:flutter/material.dart';
import 'package:chat_app_flutter/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final FocusNode testFocus = FocusNode();
  List<Message> messageList = [
    Message(text: 'Test message', fromWho: FromWho.me),
    Message(text: 'Hello friend', fromWho: FromWho.partner),
  ];

  Future<void> sendMessage(String text) async {
    final messageToAdd = Message(text: text, fromWho: FromWho.me);
    messageList.add(messageToAdd);

    notifyListeners();
    scrollToBottom();
  }

  void scrollToBottom() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 200),
        curve: Curves.easeOut);
  }
}
