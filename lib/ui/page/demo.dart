import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'demo',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
