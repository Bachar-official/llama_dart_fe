import 'package:ask_titmouse/ui/chat_screen/chat_state.dart';
import 'package:ask_titmouse/ui/chat_screen/message_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatState>(
      create: (_) => ChatState(),
      child: Consumer<ChatState>(
        builder: (context, state, __) {
          if (context.mounted && !state.listenable) {
            state.init();
          }
          return Scaffold(
            appBar: AppBar(title: const Text('Спроси Синичку'), actions: [
              IconButton(
                  icon: const Icon(Icons.wifi),
                  onPressed: state.init,
                  color: Colors.green),
            ]),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: state.scrollController,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) =>
                          MessageCard(message: state.messages[index]),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: state.messageC,
                          decoration:
                              const InputDecoration(hintText: 'Спроси Синичку'),
                          onSubmitted: (_) => state.sendMessage(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: state.sendMessage,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
