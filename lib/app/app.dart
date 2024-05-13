import 'package:ask_titmouse/app/di.dart';
import 'package:ask_titmouse/app/routing.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: di.deps.scaffoldKey,
      navigatorKey: di.deps.navKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'Спроси Синичку',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFED8B00), primary: const Color(0xFF003C71), secondary: const Color(0xFF2C2A29),),
        useMaterial3: true,
      ),
    );
  }
}
