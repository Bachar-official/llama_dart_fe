import 'package:ask_titmouse/entity/message.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatState extends ChangeNotifier {
  TextEditingController messageC = TextEditingController();
  final WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('ws://localhost:1993/ws'));
  final scrollController = ScrollController();
  List<Message> messages = [];
  bool listenable = false;

  Future<void> init() async {
    listenable = true;
    channel.stream.listen(getMessage);
  }

  void getMessage(dynamic event) {
    if (event == '␛') {
      var uuid = const Uuid().v4();
      messages.add(Message(uuid: uuid, sentByMe: false, text: ''));
    } else {
      _fillMessage(event);
    }
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
    notifyListeners();
  }

  void _fillMessage(dynamic event) {
    var found = messages.last;
    if (event != '␌') {
      found.text += event;
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
      notifyListeners();
    }
  }

  void sendMessage() {
    if (messageC.text.isNotEmpty) {
      messages.add(Message(
          uuid: const Uuid().v4(), sentByMe: true, text: messageC.text));
      channel.sink.add(messageC.text);
      messageC.clear();
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
      notifyListeners();
    }
  }
}
