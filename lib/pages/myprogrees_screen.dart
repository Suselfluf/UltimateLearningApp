import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';
import 'package:ultimate_learning_app/widgets/activity_display.dart';

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
            onPressed: () {},
          ),
          backgroundColor: BG_COLOR,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: const ActivityDisplay(
            isShadow: false,
          ),
        ),
        backgroundColor: BG_COLOR,
      );
}
