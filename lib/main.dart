import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 133, 184)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    String _newCurrentTime = DateFormat("HH:mm:ss").format(DateTime.now());

    setState(() {
      _currentTime = _newCurrentTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Icon(
            Icons.timer,
            color: Theme.of(context).colorScheme.onPrimary,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_currentTime",
              style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.titleLarge?.fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize:
                      (Theme.of(context).textTheme.titleLarge?.fontSize ?? 14)),
            ),
          ],
        ),
      ),
    );
  }
}
