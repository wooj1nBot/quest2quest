import 'package:flutter/material.dart';

class QuestApp extends StatelessWidget {
  const QuestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const QuestPage(),
    );
  }
}

class QuestPage extends StatefulWidget {
  const QuestPage({super.key});

  @override
  State<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text("친구화면"),
        )
    );
  }
}