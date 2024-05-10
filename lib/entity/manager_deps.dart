import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

typedef ManagerDeps = ({
  GlobalKey<ScaffoldMessengerState> scaffoldKey,
  GlobalKey<NavigatorState> navKey,
  Logger logger,
});
