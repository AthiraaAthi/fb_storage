import 'package:flutter/material.dart';
import 'package:new_project_practise/view/home_screen/home_screen.dart';
import 'package:new_project_practise/view/image_picker_screen/image_picker_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "image",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            ImagePickerScreen(),
          ],
        ),
      ),
    );
  }
}
