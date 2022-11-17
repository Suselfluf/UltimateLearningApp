import 'package:flutter/material.dart';

class CaseCard extends StatefulWidget {
  CaseCard({super.key, required this.case_title});
  final String case_title;

  @override
  State<CaseCard> createState() => _CaseCardState();
}

class _CaseCardState extends State<CaseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 40,
        color: Theme.of(context).colorScheme.casesCard,
        child: SizedBox(
          width: 249,
          height: 154,
          child: Column(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 18, top: 19),
                    child: SizedBox(
                        width: 150,
                        child: Expanded(
                          child: Text(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                            widget.case_title,
                            style: const TextStyle(
                                color: Color.fromRGBO(31, 31, 57, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )))),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 120),
              child: ElevatedButton(
                style: const ButtonStyle(
                  /// Change the border of the button - Ideally create new widget
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromRGBO(255, 105, 5, 1)),
                ),
                onPressed: () {},
                child: const Text(
                  'Enabled',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
