import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/lessons_exercise.dart';
import '../services/exercises_data_reomote.dart';
import 'exercise_button.dart';

class ExerciseDisplay extends StatefulWidget {
  const ExerciseDisplay(
      {super.key,
      // required this.image_url,
      // required this.button_option_1,
      // required this.button_option_2,
      // required this.button_option_3,
      // required this.button_option_4,
      required this.contextTitle,
      required this.onAnswerSubmit});

  // final String image_url;
  // final String button_option_1;
  // final String button_option_2;
  // final String button_option_3;
  // final String button_option_4;

  final AsnwerCallback onAnswerSubmit;
  final String contextTitle;

  @override
  State<ExerciseDisplay> createState() => _ExerciseDisplayState();
}

class _ExerciseDisplayState extends State<ExerciseDisplay> {
  List<LessonExercise>? exercises;
  bool isLoaded = false;
  String _image_url = "assets/images/CartoonStripDefault.png";
  String _button1 = "Name1";
  String _buttonTranslated1 = "tranlation1";
  String _button2 = "Name2";
  String _buttonTranslated2 = "tranlation2";
  String _button3 = "Name3";
  String _buttonTranslated3 = "tranlation3";
  String _button4 = "Name4";
  String _buttonTranslated4 = "tranlation4";

  void initState() {
    getExercisesData(widget.contextTitle);

    super.initState();
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => {getExercises(widget.context)});
  }

  getExercisesData(contextName) async {
    exercises = await RemoteExerciesService().getExercies(contextName);
    if (exercises != null) {
      for (var e in exercises!) {
        setState(() {
          isLoaded = true;
          // print(e.option1.word);
          _button1 = e.option1.word;
          _button2 = e.option2.word;
          _button3 = e.option3.word;
          _button4 = e.option4.word;
          _buttonTranslated1 = e.option1.meaning;
          _buttonTranslated2 = e.option2.meaning;
          _buttonTranslated3 = e.option3.meaning;
          _buttonTranslated4 = e.option4.meaning;
        });
      }
      debugPrint("Successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 263,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      _image_url), // Can be converted to requested Image
                ),
                shape: BoxShape.rectangle),
          ),
          Spacer(),
          Column(
            children: [
              ExerciseButton(
                  button_text: _button1,
                  translation: _buttonTranslated1,
                  onAnswerSubmit: widget.onAnswerSubmit),
              SizedBox(height: 10),
              ExerciseButton(
                  button_text: _button2,
                  translation: _buttonTranslated2,
                  onAnswerSubmit: widget.onAnswerSubmit),
              SizedBox(height: 10),
              ExerciseButton(
                  button_text: _button3,
                  translation: _buttonTranslated3,
                  onAnswerSubmit: widget.onAnswerSubmit),
              SizedBox(height: 10),
              ExerciseButton(
                  button_text: _button4,
                  translation: _buttonTranslated4,
                  onAnswerSubmit: widget.onAnswerSubmit)
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}

typedef AsnwerCallback = void Function(String answerData);
