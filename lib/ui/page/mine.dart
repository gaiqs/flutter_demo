import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineState();
  }
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'mine',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
