import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:store_review/store_review.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAvailable = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool isAvailable;
    try {
      isAvailable = await StoreReview.isAvailable;
    } on PlatformException {
      isAvailable = false;
    }

    if (!mounted) return;

    setState(() {
      _isAvailable = isAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example Store Review'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('isAvailable: $_isAvailable',
                    style: TextStyle(fontSize: 22.0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      padding: const EdgeInsets.all(15.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: StoreReview.requestReview
                      ,
                      child: Text("REQUEST REVIEW",
                          style: TextStyle(fontSize: 22.0))),
                )
              ]),
        ),
      ),
    );
  }
}
