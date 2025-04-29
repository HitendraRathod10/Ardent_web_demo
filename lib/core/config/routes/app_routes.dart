import 'package:ardent_web_demo/screens/ranking_screen.dart';
import 'package:ardent_web_demo/screens/schedule_screen.dart';
import 'package:ardent_web_demo/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  ///Note: web run thy ema last end point niche no apisu to e page aai jse.
  static const rankingScreen = '/ranking_screen'; ///http://localhost:56158/#/ranking_screen
  static const scheduleScreen = '/schedule_screen';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: scheduleScreen,
    navigatorKey: navigatorKey,
    routes: _routes,
  );

  static final List<GoRoute> _routes = [
    _buildRoute(rankingScreen, const RankingScreen()),
    _buildRoute(scheduleScreen, const ScheduleScreen()),
  ];

  static GoRoute _buildRoute(String path, Widget screen) {
    return GoRoute(path: path, builder: (context, state) => screen);
  }
}