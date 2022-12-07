import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/widgets/home_app_bar.dart';

import '../main.dart';
import '../widgets/activity_display.dart';
import '../widgets/lesson_card.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_COLOR,
      appBar: AppBar(
        backgroundColor: BG_COLOR,
        title: const Text(
          "Available Lessons",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(height: 20),
        LessonCard(
          lesson_title: "Random context",
        ),
        SizedBox(height: 20),
        LessonCard(
          lesson_title: "Words",
        )
      ]),
    );
  }
}
