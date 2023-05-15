import 'package:chat_app_flutter/presentations/providers/chat_provider.dart';
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onSubmit;
  final ChatProvider chatProviderInstance;

  const MessageFieldBox(
      {super.key, required this.onSubmit, required this.chatProviderInstance});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'En you message with "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            onSubmit(textController.value.text);
            textController.clear();
          },
        ));

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      focusNode: chatProviderInstance.testFocus,
      onFieldSubmitted: (value) {
        onSubmit(value);
        textController.clear();
        chatProviderInstance.testFocus.requestFocus();
      },
      onTapOutside: (event) {
        chatProviderInstance.testFocus.unfocus();
      },
    );
  }
}
