import 'package:flutter/material.dart';
import '/screen/generate.dart';
import '/screen/result.dart';

import '../../screen/home.dart';

sealed class AppRoutes{
  static const home = '/';
  static const generate = "generate";
  static const result = "result";

  static Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    home: (context) => Home(),
    generate: (context) => Generate(),
    result: (context) => Result()
  };
}