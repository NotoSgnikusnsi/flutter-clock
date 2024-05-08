// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

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
              seedColor: Color.fromARGB(255, 23, 133, 184))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _now = "";

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer timer) {
    DateTime _newCurrentTime = DateTime.now();
    String _newCurrentHour = _newCurrentTime.hour.toString();
    String _newCurrentMinute = _newCurrentTime.minute.toString();
    String _newCurrentSecond = _newCurrentTime.second.toString();
    String _newCurrentTimeString =
        "$_newCurrentHour:$_newCurrentMinute:${_newCurrentSecond.length == 1 ? '0$_newCurrentSecond' : _newCurrentSecond}";

    setState(() {
      _now = _newCurrentTimeString;
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
              "$_now",
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.titleLarge?.fontFamily,
                fontWeight: FontWeight.normal,
                fontSize:
                    (Theme.of(context).textTheme.titleLarge?.fontSize ?? 14) +
                        30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
