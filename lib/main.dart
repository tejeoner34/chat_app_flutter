import 'package:chat_app_flutter/config/theme/app_theme.dart';
import 'package:chat_app_flutter/presentations/providers/chat_provider.dart';
import 'package:chat_app_flutter/presentations/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: AppTheme(selectedColor: 'blue').theme(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
