import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/pages/account_screen.dart';
import 'package:ultimate_learning_app/widgets/activity_display.dart';
import 'package:ultimate_learning_app/widgets/progress_display.dart';

import '../widgets/context_progress_card.dart';

class CasesProgressScreen extends StatefulWidget {
  const CasesProgressScreen({super.key});

  @override
  State<CasesProgressScreen> createState() => _CasesProgressScreenState();
}

class _CasesProgressScreenState extends State<CasesProgressScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cases Progress",
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
            for (var i = 0; i < 6; i++)
              ContextProgressCard(
                progress_percent: 0.75,
                progress_title: "Guards Communication",
              )
          ],
        ),
        backgroundColor: BG_COLOR,
      );
}
