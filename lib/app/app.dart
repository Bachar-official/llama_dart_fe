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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
