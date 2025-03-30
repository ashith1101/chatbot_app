enum MessageType { user, bot }

class Message {
  final String text;
  final MessageType type;
  final DateTime timestamp;
  final bool isTyping;

  Message({
    required this.text,
    required this.type,
    required this.timestamp,
    this.isTyping = false,
  });

  Message copyWith({
    String? text,
    MessageType? type,
    DateTime? timestamp,
    bool? isTyping,
  }) {
    return Message(
      text: text ?? this.text,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}

