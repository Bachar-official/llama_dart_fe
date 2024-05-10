import 'package:ask_titmouse/entity/message.dart';
import 'package:ask_titmouse/feature/chat/chat_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatHolder extends StateNotifier<ChatState> {
  ChatHolder() : super(const ChatState.initial());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setMessages(List<Message> messages) {
    state = state.copyWith(messages: messages);
  }
}
