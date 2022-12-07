import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  cursorColor: Colors.grey,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(62, 62, 85, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        width: 18,
                        child: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(184, 184, 210, 1),
                        ),
                      ),
                      suffixIcon: const Icon(Icons.cancel_rounded,
                          color: Color.fromRGBO(184, 184, 210, 1))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
