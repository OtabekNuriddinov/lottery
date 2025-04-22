import 'package:flutter/material.dart';
import 'package:lottery/core/config/routes.dart';

class Lottery extends StatelessWidget {
  const Lottery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
