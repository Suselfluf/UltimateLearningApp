import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({
    super.key,
    required this.isShadow,
  });

  final bool
      isShadow; // Conditional rendering value - If true, card drops shadow

  @override
  State<ActivityDisplay> createState() => _ActivityDisplayState();
}

class _ActivityDisplayState extends State<ActivityDisplay> {
  int _preferencesInMinutes = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(184, 184, 210, 0.25),
              blurRadius: 10.0,
              offset: Offset(0, 9)),
        ],
      ),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.activityCard,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Learned Today",
                      style: TextStyle(color: Color.fromRGBO(184, 184, 210, 1)),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed:
                            () {}, // Request / Navigate to Profile preferences
                        child: const Text(
                          'My preferences',
                          style:
                              TextStyle(color: Color.fromRGBO(61, 92, 225, 1)),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _preferencesInMinutes.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Row(
                        children: const [
                          Text(
                            "/",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(184, 184, 210, 1)),
                          ),
                          Text("60min",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(184, 184, 210, 1)))
                        ],
                      ),
                    ),
                  ],
                ),
                LinearPercentIndicator(
                    // Round the border of the progress bar
                    width: MediaQuery.of(context).size.width * 0.65,
                    lineHeight: 8.0,
                    percent: 0.9,
                    linearGradient: const LinearGradient(colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 81, 6, 1)
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
