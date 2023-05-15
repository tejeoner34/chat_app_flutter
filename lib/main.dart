import 'package:chat_app_flutter/config/theme/app_theme.dart';
import 'package:chat_app_flutter/presentations/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme(selectedColor: 'blue').theme(),
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
