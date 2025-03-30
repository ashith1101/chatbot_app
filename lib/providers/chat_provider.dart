import 'dart:async';
import 'package:flutter/material.dart';
import '../models/message.dart';
import '../services/mock_chat_server.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [];
  final MockChatService _chatService = MockChatService();
  bool _isLoading = false;

  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;

  ChatProvider() {
    _messages.add(
      Message(
        text: "Hello! I'm your AI assistant. How can I help you today?",
        type: MessageType.bot,
        timestamp: DateTime.now(),
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final userMessage = Message(
      text: text,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
    _messages.add(userMessage);
    notifyListeners();
    _isLoading = true;
    final typingMessage = Message(
      text: "",
      type: MessageType.bot,
      timestamp: DateTime.now(),
      isTyping: true,
    );
    _messages.add(typingMessage);
    notifyListeners();
    try {
      final response = await _chatService.getResponse(text);
      _messages.removeLast();
      _messages.add(
        Message(
          text: response,
          type: MessageType.bot,
          timestamp: DateTime.now(),
        ),
      );
    } catch (e) {
      _messages.removeLast();
      _messages.add(
        Message(
          text: "Sorry, I couldn't process your request. Please try again.",
          type: MessageType.bot,
          timestamp: DateTime.now(),
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    _messages.add(
      Message(
        text: "Hello! I'm your AI assistant. How can I help you today?",
        type: MessageType.bot,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}

