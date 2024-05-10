import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/repo/net_repo.dart';
import 'package:flutter/material.dart';

class ChatManager {
  final ManagerDeps deps;
  final NetRepo netRepo;

  const ChatManager({required this.deps, required this.netRepo});
}
