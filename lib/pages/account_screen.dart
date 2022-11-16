import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/main.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Account",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: BG_COLOR,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/userImageSample.jpeg'),
                    ),
                    shape: BoxShape.circle),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  children: const [
                    Text(
                      "Manage the Vocabulary",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Color.fromRGBO(133, 133, 151, 1),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: Row(
                  children: const [
                    Text(
                      "My Progress",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Color.fromRGBO(133, 133, 151, 1),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: Row(
                  children: const [
                    Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Color.fromRGBO(133, 133, 151, 1),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        backgroundColor: BG_COLOR,
      );
}
