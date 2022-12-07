import 'package:flutter/material.dart';

class VocabularyOption extends StatefulWidget {
  const VocabularyOption(
      {super.key, required this.id, required this.word, required this.meaning});

  final int id;
  final String word;
  final String meaning;
  @override
  State<VocabularyOption> createState() => _VocabularyOptionState();
}

class _VocabularyOptionState extends State<VocabularyOption> {
  late String _buttonText = widget.word;
  bool _isTranslated = false;

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
            child: Text(
              _buttonText,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
        const Spacer(),
        IconButton(
            onPressed: () {
              setState(() {
                _isTranslated = !_isTranslated;
                if (_isTranslated)
                  _buttonText = widget.meaning;
                else
                  _buttonText = widget.word;
              });
            },
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
