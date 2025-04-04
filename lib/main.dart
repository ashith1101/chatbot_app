import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/chat_screen.dart';
import '../providers/chat_provider.dart';
import '../theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        title: 'Flutter Chatbot',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const ChatScreen(),
      ),
    );
  }
}

