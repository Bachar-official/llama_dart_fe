import 'package:ask_titmouse/entity/message.dart';
import 'package:flutter/material.dart';

@immutable
class ChatState {
  final bool isLoading;
  final List<Message> messages;

  const ChatState({required this.isLoading, required this.messages});

  const ChatState.initial()
      : isLoading = false,
        messages = const [];

  ChatState copyWith({bool? isLoading, List<Message>? messages}) => ChatState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages);
}
