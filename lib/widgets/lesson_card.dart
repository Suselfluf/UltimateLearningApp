import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/pages/case_screen.dart';
import 'package:ultimate_learning_app/pages/home_screen.dart';
import 'package:ultimate_learning_app/pages/words_practice_screen.dart';

import '../models/post.dart';
import '../services/cases_data_remote.dart';

class LessonCard extends StatefulWidget {
  const LessonCard({super.key, required this.lesson_title});
  final String lesson_title;

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  var isLoaded = false;
  List<Post>? cases;

  void initState() {
    super.initState();
    getCasesData();
  }

  getCasesData() async {
    cases = await RemoteService().getPosts();
    if (cases != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 40,
        color: Theme.of(context).colorScheme.casesCard,
        child: SizedBox(
          width: 249,
          height: 154,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 18),
              // width: 150, // For making text with 2 lines
              child: Text(
                widget.lesson_title,
                style: const TextStyle(
                    color: Color.fromRGBO(31, 31, 57, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            widget.lesson_title == "Words"
                ? Icon(Icons.g_translate_rounded)
                : Icon(Icons.question_mark_rounded),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(255, 105, 5, 1))),
              onPressed: () {
                widget.lesson_title == "Words"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WordsPracticeScreen()),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CaseScreen(context: "Random")),
                      );
              },
              child: const Text(
                'Pracitce',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer()
          ]),
        ),
      ),
    );
  }
}
