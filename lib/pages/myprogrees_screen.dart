import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/account_screen.dart';
import 'package:ultimate_learning_app/widgets/activity_display.dart';
import 'package:ultimate_learning_app/widgets/progress_display.dart';

class MyProgressScreen extends StatefulWidget {
  const MyProgressScreen({super.key});

  @override
  State<MyProgressScreen> createState() => _MyProgressScreenState();
}

class _MyProgressScreenState extends State<MyProgressScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Progress",
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
        body: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ActivityDisplay(
                  isShadow: false,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 20),
                  child: Row(
                    children: [
                      ProgressDisplay(
                          isShadow: false,
                          progress_title: 'Cases',
                          progress_percent: 0.4),
                      Spacer(),
                      ProgressDisplay(
                        isShadow: false,
                        progress_title: 'Words',
                        progress_percent: 0.75,
                      )
                    ],
                  ),
                )
              ],
            )),
        backgroundColor: BG_COLOR,
      );
}
