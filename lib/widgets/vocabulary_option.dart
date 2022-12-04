import 'package:flutter/material.dart';

class VocabularyOption extends StatefulWidget {
  const VocabularyOption({super.key});

  @override
  State<VocabularyOption> createState() => _VocabularyOptionState();
}

class _VocabularyOptionState extends State<VocabularyOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      )),
      child: Row(children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "Word",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.translate_rounded,
              color: Colors.white,
            )),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.volume_down_rounded,
        //       color: Colors.white,
        //     )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            )),
      ]),
    );
  }
}
