import 'package:flutter/material.dart';

import '../main.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text("Home Screen"),
//           toolbarHeight: 183,
//         ),
//         body: CustomScrollView(
//           slivers: [SliverAppBar.large()],
//         ),
//         backgroundColor: BG_COLOR,
//       );
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      // May be rework to simple large static app bar !!!!!!!!!!!!!!!!!!
      slivers: [
        SliverAppBar.large(
          // leading: const Padding(
          //     padding: EdgeInsets.only(left: 10, bottom: 0, right: 0, top: 40),
          //     child: Text(
          //       "Hi, UserName",
          //       style: TextStyle(
          //         color: Color.fromARGB(255, 255, 255, 255),
          //         fontSize: 24,
          //       ),
          //     )), // Manage alignment to make it corresponding to layout at Figma
          title: const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 0, right: 0, top: 0),
            child: Text(
              "Hi, User Name!",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert)) // Change Icon to user image
          ],
          backgroundColor: Color.fromRGBO(61, 92, 255, 1),
        ),
      ],
    ));
  }
}
