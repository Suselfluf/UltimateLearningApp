import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class WordsProgressCard extends StatefulWidget {
  WordsProgressCard(
      {super.key, required this.letter, required this.progress_percent});

  final String letter;
  final double progress_percent;
  final Color card_progress_color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  State<WordsProgressCard> createState() => _WordsProgressCard();
}

class _WordsProgressCard extends State<WordsProgressCard> {
  late double _progress = Random().nextDouble();

  void initState() {
    setState(() {});
    super.initState();
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
          width: 329,
          height: 90,
          child: Container(
            child: Row(
              children: [
                Spacer(),
                Text(
                  widget.letter,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Color.fromRGBO(74, 58, 255, 1),
                        ),
                        SizedBox(width: 4.5),
                        Text("Learned",
                            style: TextStyle(
                                color: Color.fromRGBO(146, 145, 165, 1),
                                fontSize: 13))
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Color.fromRGBO(240, 229, 252, 1),
                        ),
                        SizedBox(width: 4.5),
                        Text(
                          "Questionable",
                          style: TextStyle(
                              color: Color.fromRGBO(146, 145, 165, 1),
                              fontSize: 13),
                        )
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Spacer(),
                    Text(
                      "${(_progress * 100).toInt()}%",
                      style: TextStyle(
                          color: Color.fromRGBO(74, 58, 255, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${100 - (_progress * 100).toInt()}%",
                      style: TextStyle(
                          color: Color.fromRGBO(240, 229, 252, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer()
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Spacer(),
                    CircularPercentIndicator(
                      radius: 30.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent: _progress,
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Color.fromRGBO(240, 229, 252, 1),
                      progressColor: Color.fromRGBO(74, 58, 255, 1),
                    ),
                    Row(
                      children: [
                        Text(
                          (_progress * 10000).toInt().toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(74, 58, 255, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "/",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${10000 - (_progress * 100).toInt()}",
                          style: TextStyle(
                              color: Color.fromRGBO(240, 229, 252, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
