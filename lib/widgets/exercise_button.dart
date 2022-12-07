import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/vocabulary_data_remote.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ExerciseButton extends StatefulWidget {
  ExerciseButton(
      {super.key,
      required this.button_text,
      required this.translation,
      required this.onAnswerSubmit});

  final String button_text;
  final AsnwerCallback onAnswerSubmit;
  final String translation;

  @override
  State<ExerciseButton> createState() => _ExerciseButtonState();
}

class _ExerciseButtonState extends State<ExerciseButton> {
  void initState() {
    super.initState();
  }

  addWordToDictionary(word) async {
    RemoteVocabularyService().addWordToVocabulary(word);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Spacer(),
      InkWell(
        child: Container(
          width: 300,
          height: 50,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(61, 92, 255, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Align(
              child: Text(
            widget.button_text,
            // textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          )),
        ),
        onTap: () {
          widget.onAnswerSubmit(widget.button_text);
        },
      ),
      Spacer(),
      InkWell(
        child: Container(
            width: 70,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(61, 92, 255, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: const Icon(
              Icons.translate_rounded,
              color: Colors.white,
            )),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(
                      "Translation:",
                    ),
                    content: IntrinsicHeight(
                        child: Column(children: [
                      Text(
                        widget.translation,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("*Word has been added to dictionary")
                    ])));
              });
          addWordToDictionary(widget.button_text);
        },
      ),
      Spacer()
    ]);
  }
}

typedef AsnwerCallback = void Function(String answerData);
