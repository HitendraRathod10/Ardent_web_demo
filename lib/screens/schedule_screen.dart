import 'package:flutter/material.dart';

import '../core/widgets/custom_dropdown.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String? selectedTournament;

  final List<String> tournaments = [
    'Overall Test 1',
    'Overall Test 2',
    'Overall Test 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Screen')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdown<String>(
                label: 'Select Tournament',
                items: tournaments,
                selectedItem: selectedTournament,
                itemLabel: (value) {
                  return value;
                },
                onChanged: (value) {
                  setState(() {
                    selectedTournament = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
