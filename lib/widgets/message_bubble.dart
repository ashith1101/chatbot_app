import 'package:flutter/material.dart';
import '../models/message.dart';
import '../theme/app_theme.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool showAvatar;

  const MessageBubble({
    super.key,
    required this.message,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.type == MessageType.user;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    final bubbleColor = isUser
        ? (isDarkMode ? AppTheme.darkUserBubbleColor : AppTheme.userBubbleColor)
        : (isDarkMode ? AppTheme.darkBotBubbleColor : AppTheme.botBubbleColor);
    
    final textColor = isUser && isDarkMode
        ? Colors.white
        : Theme.of(context).textTheme.bodyLarge!.color;
    
    final timeFormat = DateFormat('h:mm a');
    final timeString = timeFormat.format(message.timestamp);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser && showAvatar) _buildAvatar(context),
          if (!isUser && !showAvatar) const SizedBox(width: 40),
          
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              margin: EdgeInsets.only(
                left: isUser ? 64.0 : 8.0,
                right: isUser ? 0.0 : 64.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    timeString,
                    style: TextStyle(
                      color: textColor?.withOpacity(0.6),
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          if (isUser && showAvatar) _buildUserAvatar(context),
          if (isUser && !showAvatar) const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.smart_toy_outlined,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildUserAvatar(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.person_outline,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

