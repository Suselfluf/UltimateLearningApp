import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'exercise_button.dart';

class ExerciseDisplay extends StatefulWidget {
  const ExerciseDisplay(
      {super.key,
      required this.image_url,
      required this.button_option_1,
      required this.button_option_2,
      required this.button_option_3,
      required this.button_option_4,
      required this.onAnswerSubmit});

  final String image_url;
  final String button_option_1;
  final String button_option_2;
  final String button_option_3;
  final String button_option_4;

  final AsnwerCallback onAnswerSubmit;

  @override
  State<ExerciseDisplay> createState() => _ExerciseDisplayState();
}

class _ExerciseDisplayState extends State<ExerciseDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 42),
      child: Column(
        children: [
          // TextButton(
          //     onPressed: () {
          //       widget.onAnswerSubmit("Some Text");
          //     },
          //     child: Text('Press')),
          Container(
            width: 350,
            height: 263,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image_url
                      .toString()), // Can be converted to requested Image
                ),
                shape: BoxShape.rectangle),
          ),
          Spacer(),
          Column(
            children: [
              ExerciseButton(
                  button_text: widget.button_option_1,
                  onAnswerSubmit: widget.onAnswerSubmit),
              SizedBox(height: 10),
              ExerciseButton(
                  button_text: widget.button_option_2,
                  onAnswerSubmit: widget.onAnswerSubmit),
              SizedBox(height: 10),
              ExerciseButton(
                  button_text: widget.button_option_3,
                  onAnswerSubmit: widget.onAnswerSubmit),
              SizedBox(height: 10),
              ExerciseButton(
                  button_text: widget.button_option_4,
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
