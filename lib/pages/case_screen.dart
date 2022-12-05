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
  var isLoaded = false;
  int _counter = 0;
  String _caseName = "Name1";
  String _contextTitle = "Context Title";
  List<LessonExercise>? exercises;
  void sendAnswer(answerData) => {print("Sending data: " + answerData)};

  void getExercises(contextTitle) {
    print("Request sended");
    setState(() {
      _contextTitle = contextTitle;
    });
  }

  getExercisesData(contextName) async {
    exercises = await RemoteExerciesService().getExercies(contextName);
    if (exercises != null) {
      setState(() {
        isLoaded = true;
      });
      debugPrint("Successful");
      for (var e in exercises!) print(e.context.context);
    }
  }

  void initState() {
    getExercisesData(widget.context);

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
                MaterialPageRoute(builder: (context) => HomeScreen()),
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
          child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ExerciseDisplay(
                  image_url: "assets/images/CartoonStripDefault.png",
                  button_option_1: "Option 1",
                  button_option_2: "Option 2",
                  button_option_3: "Option 3",
                  button_option_4: "Option 4",
                  onAnswerSubmit: (String answerData) {
                    setState(() {
                      print("State has been changed");
                      _caseName = answerData; // Sent POST request with answer
                      sendAnswer(answerData);
                    });
                  }))),
      backgroundColor: BG_COLOR,
    );
  }
}
