import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

GlobalKey<NavigatorState> get navigatorKey => getIt.get<GlobalKey<NavigatorState>>();

Future<void> appSetup() async {
  getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
}