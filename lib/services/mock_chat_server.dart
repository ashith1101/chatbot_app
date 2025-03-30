import 'dart:async';
import 'dart:math';

class MockChatService {
  final Random _random = Random();
  final Map<String, List<String>> _responses = {
    'greeting': [
      "Hello! How can I assist you today?",
      "Hi there! What can I help you with?",
      "Greetings! How may I be of service?",
    ],
    'question': [
      "That's an interesting question. Based on my knowledge, I would say that...",
      "Great question! Here's what I know about that topic...",
      "I'd be happy to help with that. The answer is...",
    ],
    'thanks': [
      "You're welcome! Is there anything else you'd like to know?",
      "Happy to help! Let me know if you have other questions.",
      "My pleasure! Feel free to ask if you need more assistance.",
    ],
    'default': [
      "I understand your message. Could you provide more details so I can assist better?",
      "I'm processing your request. Can you elaborate a bit more?",
      "I'm here to help. What specific information are you looking for?",
    ],
  };
  Future<String> getResponse(String message) async {
    await Future.delayed(Duration(milliseconds: 1000 + _random.nextInt(2000)));
    final lowerMessage = message.toLowerCase();
    String category = 'default';
    if (lowerMessage.contains('hello') || 
        lowerMessage.contains('hi') || 
        lowerMessage.contains('hey')) {
      category = 'greeting';
    } else if (lowerMessage.contains('?')) {
      category = 'question';
    } else if (lowerMessage.contains('thank')) {
      category = 'thanks';
    }
    final responses = _responses[category]!;
    return responses[_random.nextInt(responses.length)];
  }
}

