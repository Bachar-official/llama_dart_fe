import 'package:ask_titmouse/feature/chat/chat_screen.dart';
import 'package:ask_titmouse/feature/resources/resources_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const chatPage = '/';
  static const resourcesPage = '/resources';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chatPage:
        return _buildRoute((context) => const ChatScreen(), settings);
      case resourcesPage:
        return _buildRoute((context) => const ResourcesScreen(), settings);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, RouteSettings settings) =>
    MaterialPageRoute(builder: builder, settings: settings);
