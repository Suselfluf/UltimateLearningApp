import 'package:flutter/material.dart';

class CaseCard extends StatefulWidget {
  const CaseCard({super.key, required this.case_title});
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
                    padding: const EdgeInsets.only(left: 18, top: 19),
                    child: Container(
                      // width: 150, // For making text with 2 lines
                      child: Text(
                        widget.case_title,
                        style: const TextStyle(
                            color: Color.fromRGBO(31, 31, 57, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.only(top: 40, right: 100, bottom: 10),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(255, 105, 5, 1))),
                    onPressed: () {},
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
