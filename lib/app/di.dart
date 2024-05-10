import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/feature/chat/chat_holder.dart';
import 'package:ask_titmouse/feature/chat/chat_manager.dart';
import 'package:ask_titmouse/feature/resources/resources_holder.dart';
import 'package:ask_titmouse/feature/resources/resources_manager.dart';
import 'package:ask_titmouse/repo/net_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DI {
  final Dio dio = Dio();
  final ManagerDeps deps = (
    scaffoldKey: GlobalKey<ScaffoldMessengerState>(),
    navKey: GlobalKey<NavigatorState>(),
    logger: Logger(),
  );
  final ChatHolder chatHolder = ChatHolder();
  final ResourcesHolder resourcesHolder = ResourcesHolder();

  late final NetRepo netRepo;
  late final ChatManager chatManager;
  late final ResourcesManager resourcesManager;

  Future<void> init() async {
    deps.logger.d('Initializing DI');
    netRepo = NetRepo(dio: dio);
    chatManager = ChatManager(deps: deps, netRepo: netRepo, holder: chatHolder);
    resourcesManager =
        ResourcesManager(deps: deps, netRepo: netRepo, holder: resourcesHolder);
    deps.logger.i('DI initialized');
  }
}

final di = DI();
