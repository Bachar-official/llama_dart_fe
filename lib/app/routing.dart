import 'package:ask_titmouse/feature/chat/chat_screen.dart';
import 'package:ask_titmouse/feature/create_resource/create_resource_screen.dart';
import 'package:ask_titmouse/feature/resources/resources_screen.dart';
import 'package:ask_titmouse/feature/update_resource/update_resource_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const chatPage = '/';
  static const resourcesPage = '/resources';
  static const createResourcePage = '/create';
  static const editResourcePage = '/edit';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chatPage:
        return _buildRoute((context) => const ChatScreen(), settings);
      case resourcesPage:
        return _buildRoute((context) => const ResourcesScreen(), settings);
      case createResourcePage:
        return _buildRoute((context) => const CreateResourceScreen(), settings);
      case editResourcePage:
        return _buildRoute((context) => const UpdateResourceScreen(), settings);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, RouteSettings settings) =>
    MaterialPageRoute(builder: builder, settings: settings);
