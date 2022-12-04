import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/account_screen.dart';
import 'package:ultimate_learning_app/widgets/search_bar.dart';

import '../widgets/vocabulary_option.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  List<int> vocabulary_array = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_COLOR,
      appBar: AppBar(
        backgroundColor: BG_COLOR,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Vocabulary",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: [
        SearchInput(),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                // for (int i = 0; i < vocabulary_array.length; i++)
                //   VocabularyOption(),
                for (var i in vocabulary_array)
                  VocabularyOption(), // Looping trhough recieved array
              ],
            ))
      ]),
    );
  }
}
