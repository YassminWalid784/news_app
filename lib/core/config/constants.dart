import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants {
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);

  static const String apiKey ='e2a0fa5857a045ce98105b7aab42f06c';
  static const String baseUrl =' newsapi.org';
}
