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
    );
  }
}
