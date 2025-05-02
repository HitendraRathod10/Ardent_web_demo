import 'package:ardent_web_demo/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HOME SCREEN",style: TextStyle(
          color: AppColors.primaryRed,
          fontSize: 20
        )),
      )
    );
  }
} 