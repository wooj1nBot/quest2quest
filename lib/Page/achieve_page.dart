import 'package:flutter/material.dart';

class AchieveApp extends StatelessWidget {
  const AchieveApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const AchievePage(),
    );
  }
}

class AchievePage extends StatefulWidget {
  const AchievePage({super.key});
  @override
  State<AchievePage> createState() => _AchievePageState();
}

class _AchievePageState extends State<AchievePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text("업적화면"),
        )
    );
  }
}