import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressDisplay extends StatefulWidget {
  ProgressDisplay(
      {super.key,
      required this.isShadow,
      required this.progress_title,
      required this.progress_percent});

  final bool
      isShadow; // Conditional rendering value - If true, card drops shadow
  final String progress_title;
  final double progress_percent;
  final Color card_progress_color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  State<ProgressDisplay> createState() => _ProgressDisplay();
}

class _ProgressDisplay extends State<ProgressDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          widget.isShadow
              ? BoxShadow(
                  color: Color.fromRGBO(184, 184, 210, 0.25),
                  blurRadius: 10.0,
                  offset: Offset(0, 9))
              : BoxShadow(
                  color: Color.fromRGBO(184, 184, 210, 0.0),
                  blurRadius: 10.0,
                  offset: Offset(0, 9)),
        ],
      ),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.activityCard,
        child: SizedBox(
          width: 160,
          height: 182,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 25),
            child: Column(
              children: [
                Text(
                  "${widget.progress_title}Progress",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 46),
                  child: LinearPercentIndicator(
                      // Round the border of the progress bar
                      width: MediaQuery.of(context).size.width * 0.35,
                      lineHeight: 6.0,
                      percent: widget.progress_percent,
                      linearGradient: LinearGradient(colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        widget.card_progress_color // Random color's
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60, top: 8),
                  child: Text(
                    "Completed",
                    style: TextStyle(color: Color.fromRGBO(184, 184, 210, 1)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "${(widget.progress_percent * 100).toInt()}%",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.play_circle_rounded,
                      size: 44,
                      color: widget.card_progress_color,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
