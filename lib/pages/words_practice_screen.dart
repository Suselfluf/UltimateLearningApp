import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/lessons_exercise.dart';
import '../services/exercises_data_reomote.dart';
import '../widgets/exersice_display.dart';

class WordsPracticeScreen extends StatefulWidget {
  WordsPracticeScreen({super.key});

  @override
  State<WordsPracticeScreen> createState() => _WordsPracticeScreenState();
}

class _WordsPracticeScreenState extends State<WordsPracticeScreen> {
  void getExercises(contextTitle) {
    setState(() {});
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {});
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
        title: Text("Words Practice", style: TextStyle(color: Colors.white)),
      ),
      body: Align(alignment: Alignment.center, child: Text("Body text")),
      backgroundColor: BG_COLOR,
    );
  }
}
