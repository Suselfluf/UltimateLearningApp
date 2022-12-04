import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/pages/account_screen.dart';
import 'package:ultimate_learning_app/pages/case_screen.dart';
import 'package:ultimate_learning_app/pages/lessons_screen.dart';
import 'package:ultimate_learning_app/pages/myprogrees_screen.dart';
import 'package:ultimate_learning_app/pages/home_screen.dart';

// ignore: constant_identifier_names
const BG_COLOR = Color.fromRGBO(31, 31, 57, 1);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Ultimate Learning App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: const MyStatefulWidget(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  // final screens = [
  //   const Center(child: Text('Learning Cases')),
  //   const Center(child: Text('Home')),
  //   const Center(child: Text('Account')),
  // ];
  static const List<Widget> _widgetOptions = <Widget>[
    // screen's list
    // MyProgressScreen(),
    LessonsScreen(),
    HomeScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_COLOR,
      body: Center(
        child: _widgetOptions.elementAt(
            _selectedIndex), //Displays corresponing to chosen index screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Course',
            backgroundColor: BG_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
            backgroundColor: BG_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_rounded,
            ),
            label: 'Account',
            backgroundColor: BG_COLOR,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(61, 92, 225, 1),
        unselectedItemColor: const Color.fromRGBO(184, 184, 210, 1),
        onTap: _onItemTapped,
        backgroundColor: BG_COLOR,
      ),
    );
  }
}
