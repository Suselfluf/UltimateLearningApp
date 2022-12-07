import 'package:flutter/material.dart';
import 'package:ultimate_learning_app/models/post.dart';
import 'package:ultimate_learning_app/services/cases_data_remote.dart';
import 'package:ultimate_learning_app/widgets/home_app_bar.dart';
import '../widgets/activity_display.dart';
import '../widgets/case_card.dart';
import '../widgets/context_progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoaded = false;
  List<Post>? posts;
  @override
  void initState() {
    super.initState();
    getCasesData();
  }

  getCasesData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(31, 31, 57, 1),
        body: CustomScrollView(
          slivers: [
            const HomeAppBar(
              user_name: "User Name",
            ),
            SliverToBoxAdapter(
              // Rest of the content can be placed here
              child: Column(
                children: [
                  ActivityDisplay(
                    isShadow: true,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(top: 12),
                    child: Visibility(
                      visible: isLoaded,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: Column(children: [
                        if (posts != null)
                          for (var i in posts!)
                            ContextProgressCard(
                              progress_percent: i.weight,
                              progress_title: i.meaning,
                            )
                        // CaseCard(case_title: i.meaning)
                      ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
