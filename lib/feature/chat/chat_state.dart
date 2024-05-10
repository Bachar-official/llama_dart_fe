import 'package:ask_titmouse/entity/message.dart';
import 'package:flutter/material.dart';

@immutable
class ChatState {
  final bool isLoading;
  final List<Message> messages;
  final Stream<dynamic>? chatStream;

  const ChatState(
      {required this.isLoading,
      required this.messages,
      required this.chatStream});

  const ChatState.initial()
      : isLoading = false,
        messages = const [],
        chatStream = null;

  ChatState copyWith(
          {bool? isLoading,
          List<Message>? messages,
          Stream<dynamic>? chatStream,
          bool nullableStream = false}) =>
      ChatState(
          isLoading: isLoading ?? this.isLoading,
          chatStream: nullableStream ? null : chatStream ?? this.chatStream,
          messages: messages ?? this.messages);
}
