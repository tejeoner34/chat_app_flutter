import 'package:chat_app_flutter/presentations/widgets/message_bubble.dart';
import 'package:chat_app_flutter/presentations/widgets/partner_bubble.dart';
import 'package:chat_app_flutter/presentations/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My chat'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.mundodeportivo.com/alfabeta/hero/2023/04/goku-esta-de-acuerdo-con-esta-critica-de-los-fans-a-la-serie.jpg?width=768&aspect_ratio=16:9&format=nowebp')),
        ),
      ),
      body: _ChatContainer(),
    );
  }
}

class _ChatContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 150,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? const PartnerBubble()
                    : const MessageBubble();
              },
            )),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
