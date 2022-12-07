import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../main.dart';
import '../models/lessons_exercise.dart';
import '../services/exercises_data_reomote.dart';
import 'exercise_button.dart';

class ExerciseDisplay extends StatefulWidget {
  const ExerciseDisplay({super.key, required this.contextTitle});

  final String contextTitle;

  @override
  State<ExerciseDisplay> createState() => _ExerciseDisplayState();
}

class _ExerciseDisplayState extends State<ExerciseDisplay> {
  List<LessonExercise>? exercises;
  bool isLoaded = false;
  bool isComplete = false;
  bool isMistake = false;
  String _image_url = "assets/images/Image6.jpg";
  String _button1 = "Name1";
  String _buttonTranslated1 = "tranlation1";
  String _button2 = "Name2";
  String _buttonTranslated2 = "tranlation2";
  String _button3 = "Name3";
  String _buttonTranslated3 = "tranlation3";
  String _button4 = "Name4";
  String _buttonTranslated4 = "tranlation4";
  int index = 0;

  void initState() {
    if (widget.contextTitle == "Random") {
      getRandomExercisesData();
    } else {
      getRandomExercisesData();
      // getExercisesData(widget.contextTitle);
    }

    super.initState();
  }

  void submitAnswer(userChoice) =>
      {print("New one: " + userChoice), randomExerciseIteration(userChoice)};

  void sendRequestWithAnswer(choice) => {
        choice == exercises![index].answer.word
            ? {RemoteExerciesService().submitAnswer(choice, '1')}
            : {RemoteExerciesService().submitAnswer(choice, '0')}
      };

  getRandomExercisesData() async {
    if (widget.contextTitle == "Random") {
      exercises = await RemoteExerciesService().getRandomExercies();
      if (exercises != null) {
        setState(() {
          print("Initial iteration:" + index.toString());
          isLoaded = true;
          print(exercises![index].answer.word);
          _button1 = exercises![index].option1.word;
          _button2 = exercises![index].option2.word;
          _button3 = exercises![index].option3.word;
          _button4 = exercises![index].option4.word;
          _buttonTranslated1 = exercises![index].option1.meaning;
          _buttonTranslated2 = exercises![index].option2.meaning;
          _buttonTranslated3 = exercises![index].option3.meaning;
          _buttonTranslated4 = exercises![index].option4.meaning;
        });
      }
    } else {
      exercises =
          await RemoteExerciesService().getExercies(widget.contextTitle);
      if (exercises != null) {
        setState(() {
          print("Initial iteration:" + index.toString());
          isLoaded = true;
          // print(e.option1.word);
          _button1 = exercises![index].option1.word;
          _button2 = exercises![index].option2.word;
          _button3 = exercises![index].option3.word;
          _button4 = exercises![index].option4.word;
          _buttonTranslated1 = exercises![index].option1.meaning;
          _buttonTranslated2 = exercises![index].option2.meaning;
          _buttonTranslated3 = exercises![index].option3.meaning;
          _buttonTranslated4 = exercises![index].option4.meaning;
        });
      }
    }
  }

  randomExerciseIteration(userChoice) async {
    if (isMistake) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          isMistake = false;
        });
      });
    }
    if (index < exercises!.length) {
      setState(() {
        isLoaded = true;
        print(index);
        sendRequestWithAnswer(userChoice);
        if (exercises![index].id == 1) {
          _image_url = "assets/images/Image6.jpg";
        } else {
          _image_url = "assets/images/Image4.jpg";
        }
        _button1 = exercises![index].option1.word;
        _button2 = exercises![index].option2.word;
        _button3 = exercises![index].option3.word;
        _button4 = exercises![index].option4.word;
        _buttonTranslated1 = exercises![index].option1.meaning;
        _buttonTranslated2 = exercises![index].option2.meaning;
        _buttonTranslated3 = exercises![index].option3.meaning;
        _buttonTranslated4 = exercises![index].option4.meaning;
        // _button2 = e.option2.word;
        // _button3 = e.option3.word;
        // _button4 = e.option4.word;
        // _buttonTranslated1 = e.option1.meaning;
        // _buttonTranslated2 = e.option2.meaning;
        // _buttonTranslated3 = e.option3.meaning;
        // _buttonTranslated4 = e.option4.meaning;
      });
    } else {
      setState(() {
        isComplete = true;
        Future.delayed(const Duration(milliseconds: 5000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: isComplete
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.done_outline_rounded,
                  size: 140,
                  color: Colors.green,
                ),
                Text(
                  "Completed",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ],
            )
          : Column(
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
                      onAnswerSubmit: (String answerData) {
                        setState(() {
                          // Sent POST request with answer
                          if (answerData != exercises![index].answer.word) {
                            isMistake = true;
                          }
                          index++;
                          submitAnswer(answerData);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    ExerciseButton(
                      button_text: _button2,
                      translation: _buttonTranslated2,
                      onAnswerSubmit: (String answerData) {
                        setState(() {
                          if (answerData != exercises![index].answer.word) {
                            isMistake = true;
                          }
                          // Sent POST request with answer
                          index++;
                          submitAnswer(answerData);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    ExerciseButton(
                      button_text: _button3,
                      translation: _buttonTranslated3,
                      onAnswerSubmit: (String answerData) {
                        setState(() {
                          // Sent POST request with answer
                          if (answerData != exercises![index].answer.word) {
                            isMistake = true;
                          }
                          index++;
                          submitAnswer(answerData);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    ExerciseButton(
                      button_text: _button4,
                      translation: _buttonTranslated4,
                      onAnswerSubmit: (String answerData) {
                        setState(() {
                          // Sent POST request with answer
                          if (answerData != exercises![index].answer.word) {
                            isMistake = true;
                          }
                          index++;
                          submitAnswer(answerData);
                        });
                      },
                    ),
                  ],
                ),
                isMistake
                    ? Icon(
                        Icons.close,
                        size: 45,
                        color: Colors.redAccent,
                      )
                    : SizedBox(
                        height: 45,
                      ),
                Spacer()
              ],
            ),
    );
  }
}

typedef AsnwerCallback = void Function(String answerData);
