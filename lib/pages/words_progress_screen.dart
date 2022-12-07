import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/account_screen.dart';
import 'package:ultimate_learning_app/widgets/activity_display.dart';
import 'package:ultimate_learning_app/widgets/progress_display.dart';
import 'package:ultimate_learning_app/widgets/words_progress_card.dart';

import '../widgets/context_progress_card.dart';

class WordsProgressScreen extends StatefulWidget {
  const WordsProgressScreen({super.key});

  @override
  State<WordsProgressScreen> createState() => _WordsProgressScreenState();
}

class _WordsProgressScreenState extends State<WordsProgressScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Words Learning Progress",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: BG_COLOR,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          children: <Widget>[
            for (var i = 0; i < 12; i++)
              WordsProgressCard(
                progress_percent: 0.75,
                letter: "A",
              )
          ],
        ),
        backgroundColor: BG_COLOR,

        // Column(
        //   children: [
        // for (var i = 0; i < 5; i++)
        //   WordsProgressCard(
        //     progress_percent: 0.75,
        //     letter: "A",
        //   )
        //   ],
        // ),
        // backgroundColor: BG_COLOR,
      );
}
