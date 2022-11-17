import 'package:flutter/material.dart';

import '../widgets/activity_display.dart';
import '../widgets/case_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(31, 31, 57, 1),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Hi, User Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Aleo',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.white),
                      ),
                      const Text(
                        "Let's start learning",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Aleo',
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 80,
                    height: 120,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/userImageSample.jpeg'),
                        ),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
              backgroundColor: const Color.fromRGBO(61, 92, 255, 1),
              toolbarHeight: 120,
              floating: true,
              pinned: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              // Rest of the content can be placed here
              child: Column(
                children: [
                  ActivityDisplay(
                    isShadow: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(12),
                      child: Row(children: [
                        CaseCard(
                          case_title: "Guards Communication",
                        ),
                        CaseCard(
                          case_title: "Dorm Issues",
                        )
                      ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
