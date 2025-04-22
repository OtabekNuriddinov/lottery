import 'package:flutter/material.dart';
import 'package:lottery/app.dart';
import 'package:lottery/app_state/change_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const Lottery(),
    ),
  );
}
