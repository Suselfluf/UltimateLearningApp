import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/lessons_exercise.dart';
import '../services/exercises_data_reomote.dart';
import '../widgets/exersice_display.dart';

class CaseScreen extends StatefulWidget {
  CaseScreen({super.key, required this.context});

  final String context;

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> {
  String _caseName = "Name1";
  String _contextTitle = "Context Title";
  List<LessonExercise>? exercises;
  void sendAnswer(answerData) => {print("Sending data: " + answerData)};

  void getExercises(contextTitle) {
    setState(() {
      _contextTitle = contextTitle;
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => {getExercises(widget.context)});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BG_COLOR,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        title: Text(_contextTitle, style: TextStyle(color: Colors.white)),
      ),
      body: Align(
          alignment: Alignment.center,
          child: ExerciseDisplay(
              contextTitle: widget.context,
              onAnswerSubmit: (String answerData) {
                setState(() {
                  _caseName = answerData; // Sent POST request with answer
                  sendAnswer(answerData);
                });
              })),
      backgroundColor: BG_COLOR,
    );
  }
}
