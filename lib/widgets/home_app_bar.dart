import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.user_name});

  final String user_name;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        children: [
          Column(
            children: [
              Text(
                'Hi, ${widget.user_name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                  image: AssetImage(
                      'assets/images/userImageSample.jpeg'), // Can be converted to requested Image
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
    );
  }
}
