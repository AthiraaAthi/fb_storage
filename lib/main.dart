import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project_practise/view/tab_bar_screen/tab_bar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBN6sESyYpw5xxNU7GRQ3iFF1QyMr0HXl8",
          appId: "1:732239600309:android:72322254486c2d28e6bcfc",
          messagingSenderId: "",
          projectId: "fb-practise-a21f2",
          storageBucket: "fb-practise-a21f2.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarScreen(),
    );
  }
}
