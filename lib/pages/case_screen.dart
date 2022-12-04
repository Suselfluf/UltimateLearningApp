import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/exersice_display.dart';

class CaseScreen extends StatefulWidget {
  CaseScreen({super.key, required this.context});

  final String context;

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> {
  int _counter = 0;
  String _caseName = "Name1";
  String _contextTitle = "Context Title";
  @override
  void sendAnswer(answerData) => {print("Sending data: " + answerData)};
  void getExercises(contextTitle) {
    print("Request sended");
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
            // Navigator.of(context).pop(
            //   MaterialPageRoute(
            //     builder: (context) => const HomeScreen(),    // Navigation
            //   ),
            // );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).pop(
              //   MaterialPageRoute(
              //     builder: (context) => const HomeScreen(),    // Navigation
              //   ),
              // );
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
            }),
      ),
      backgroundColor: BG_COLOR,
    );
  }
}
