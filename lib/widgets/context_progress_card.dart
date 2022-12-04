import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ultimate_learning_app/pages/case_screen.dart';
import 'package:ultimate_learning_app/pages/cases_progress_screen.dart';

class ContextProgressCard extends StatefulWidget {
  ContextProgressCard(
      {super.key,
      required this.progress_title,
      required this.progress_percent});

  final String progress_title;
  final double progress_percent;
  final Color card_progress_color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  State<ContextProgressCard> createState() => _ContextProgressCard();
}

class _ContextProgressCard extends State<ContextProgressCard> {
  // String percentText = ();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.activityCard,
        child: SizedBox(
          width: 360,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 11),
            child: Column(
              children: [
                Text(
                  "${widget.progress_title} Progress",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(children: [
                  Spacer(),
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 5.0,
                    percent: widget.progress_percent,
                    center: Text(
                      "${(widget.progress_percent * 100).toInt()}%",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    progressColor: widget.card_progress_color,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "Go to practise:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CaseScreen(
                                      context: widget.progress_title,
                                    )),
                          );
                        },
                        icon: Icon(Icons.play_circle_fill_rounded),
                        iconSize: 45,
                        color: widget.card_progress_color,
                      )
                    ],
                  ),
                  Spacer(),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
