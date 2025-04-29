import 'package:ardent_web_demo/core/config/routes/app_routes.dart';
import 'package:ardent_web_demo/core/config/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            pushPage(context, AppRoutes.rankingScreen);
          },
          child: const Text('Go to Ranking screen'),
        ),
      ),
    );
  }
}
