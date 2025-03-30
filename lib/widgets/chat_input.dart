import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateSendButton);
  }

  void _updateSendButton() {
    setState(() {
      _canSend = _controller.text.trim().isNotEmpty;
    });
  }

  void _handleSubmit() {
    if (!_canSend) return;
    
    final message = _controller.text;
    _controller.clear();
    
    Provider.of<ChatProvider>(context, listen: false).sendMessage(message);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<ChatProvider, bool>((provider) => provider.isLoading);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : const Color(0xFF2D2D2D),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                enabled: !isLoading,
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _handleSubmit(),
              maxLines: null,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(width: 8.0),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 48,
            height: 48,
            child: Material(
              color: _canSend && !isLoading
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(24.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(24.0),
                onTap: (_canSend && !isLoading) ? _handleSubmit : null,
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

