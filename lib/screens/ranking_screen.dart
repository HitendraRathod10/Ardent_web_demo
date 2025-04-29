import 'package:ardent_web_demo/core/config/routes/app_routes.dart';
import 'package:ardent_web_demo/core/config/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ranking screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            pushPage(context, AppRoutes.scheduleScreen);
          },
          child: const Text('Go to Schedule screen'),
        ),
      ),
    );
  }
}
