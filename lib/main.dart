import 'package:ask_titmouse/app/app.dart';
import 'package:ask_titmouse/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await di.init();
  runApp(
    const ProviderScope(child: App()),
  );
}
