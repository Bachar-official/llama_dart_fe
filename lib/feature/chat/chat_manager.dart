import 'package:ask_titmouse/app/routing.dart';
import 'package:ask_titmouse/const/symbols.dart';
import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/entity/message.dart';
import 'package:ask_titmouse/entity/snackbar_reason.dart';
import 'package:ask_titmouse/feature/chat/chat_holder.dart';
import 'package:ask_titmouse/repo/net_repo.dart';
import 'package:ask_titmouse/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ChatManager {
  final ManagerDeps deps;
  final NetRepo netRepo;
  final ChatHolder holder;
  final TextEditingController messageC = TextEditingController();

  ChatManager(
      {required this.deps, required this.netRepo, required this.holder}) {
    setChatStream();
  }

  void setLoading(bool isLoading) => holder.setLoading(isLoading);

  Future<void> setChatStream() async {
    try {
      setLoading(true);
      deps.logger.d('Connecting to WebSocket');
      holder.setChatStream(netRepo.chatStream);
      await for (final msg in netRepo.chatStream) {
        if (msg == beginSymbol) {
          receiveMessage();
        } else {
          fillMessage(msg);
        }
      }
    } catch (e) {
      showSnackBar(
          deps: deps,
          reason: SnackBarReason.error,
          message: 'Ошибка при подключении к чату:\n$e');
    } finally {
      setLoading(false);
    }
  }

  void receiveMessage() {
    deps.logger.i('Begin message symbol received');
    var message = Message(uuid: const Uuid().v4(), sentByMe: false, text: '');
    holder.setMessages([...holder.oState.messages, message]);
  }

  void fillMessage(String text) {
    if (text != endSymbol) {
      var messages = holder.oState.messages;
      var message = messages.last;
      message.text += text;
      messages[messages.length - 1] = message;
      holder.setMessages(messages);
    }
  }

  void sendMessage() {
    var message =
        Message(sentByMe: true, uuid: const Uuid().v4(), text: messageC.text);
    holder.setMessages([...holder.oState.messages, message]);
    netRepo.sendMessage(messageC.text);
    messageC.clear();
  }

  Future<void> goToResPage() async {
    await deps.navKey.currentState!.pushReplacementNamed(AppRouter.resourcesPage);
  }
}
