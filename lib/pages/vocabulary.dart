import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/account_screen.dart';
import 'package:ultimate_learning_app/widgets/search_bar.dart';

import '../models/vocabulary_data.dart';
import '../services/vocabulary_data_remote.dart';
import '../widgets/vocabulary_option.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  List<VocabularyData>? vocabulary_data;
  bool isLoaded = false;

  void initState() {
    super.initState();
    getVocabularyData();
  }

  getVocabularyData() async {
    vocabulary_data = await RemoteVocabularyService().getVocabulary();
    if (vocabulary_data != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
                Visibility(
                  visible: isLoaded,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: Column(children: [
                    if (vocabulary_data != null)
                      for (var v_c in vocabulary_data!)
                        // Text(v_c.vocabularyWord.meaning)
                        VocabularyOption(
                          id: v_c.vocabularyWord.id,
                          word: v_c.vocabularyWord.word,
                          meaning: v_c.vocabularyWord.meaning,
                        )
                  ]),
                ),
              ],
            ))
      ]),
    );
  }
}
