import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../pages/case_screen.dart';

class ContextProgressCard extends StatefulWidget {
  ContextProgressCard(
      {super.key,
      required this.progress_title,
      required this.progress_percent});

  final String progress_title;
  final double progress_percent;
  late Color card_progress_color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  State<ContextProgressCard> createState() => _ContextProgressCard();
}

class _ContextProgressCard extends State<ContextProgressCard> {
  // String percentText = ();
  late double _progress;
  List<Color> colors = [
    Colors.white,
    Color.fromRGBO(47, 47, 66, 1),
    Colors.yellow
  ];
  void initState() {
    if (widget.progress_percent != null) {
      _progress = widget.progress_percent;
    } else {
      _progress = 0.45;
    }
    super.initState();
    if (widget.card_progress_color == colors[0] ||
        widget.card_progress_color == colors[1]) {
      setState(() {
        widget.card_progress_color =
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.activityCard,
        child: SizedBox(
          width: 340,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Column(
              children: [
                BorderedText(
                  strokeWidth: 1.0,
                  child: Text(
                    "${widget.progress_title} Progress",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Row(children: [
                  const Spacer(),
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
                  const Spacer(),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: widget.card_progress_color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0) //
                                        ),
                                border: Border.all(
                                    color: widget.card_progress_color)),
                            width: 200,
                            child: BorderedText(
                              strokeWidth: 1.0,
                              child: const Text(
                                "Mistakes Practice",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CaseScreen(
                                      context: widget.progress_title)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0) //
                                        ),
                                border: Border.all(
                                    color: widget.card_progress_color)),
                            alignment: Alignment.center,
                            width: 200,
                            child: Text(
                              "Learn New",
                              style: TextStyle(
                                  color: widget.card_progress_color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ))
                    ],
                  ),
                  const Spacer(),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
