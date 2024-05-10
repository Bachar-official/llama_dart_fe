import 'package:ask_titmouse/app/di.dart';
import 'package:ask_titmouse/feature/chat/chat_holder.dart';
import 'package:ask_titmouse/feature/chat/chat_state.dart';
import 'package:ask_titmouse/feature/chat/components/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider =
    StateNotifierProvider<ChatHolder, ChatState>((ref) => di.chatHolder);

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final manager = di.chatManager;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Спроси Синичку'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: manager.goToResPage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) => MessageCard(
                  message: state.messages[index],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: manager.messageC,
                    decoration:
                        const InputDecoration(hintText: 'Введите запрос'),
                    onSubmitted: (_) => manager.sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: manager.sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
