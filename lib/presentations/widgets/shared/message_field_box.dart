import 'package:chat_app_flutter/presentations/providers/chat_provider.dart';
import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  final ChatProvider chatProviderInstance;

  const MessageFieldBox(
      {super.key, required this.onSubmit, required this.chatProviderInstance});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  late TextEditingController textController;
  bool _isFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isFieldEmpty = textController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
            widget.onSubmit(textController.value.text);
            textController.clear();
          },
          color: _isFieldEmpty
              ? null
              : colors.primary,
        ));

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      focusNode: widget.chatProviderInstance.testFocus,
      onFieldSubmitted: (value) {
        widget.onSubmit(value);
        textController.clear();
        widget.chatProviderInstance.testFocus.requestFocus();
      },
      onTapOutside: (event) {
        widget.chatProviderInstance.testFocus.unfocus();
      },
    );
  }
}
