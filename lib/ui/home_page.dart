import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/demo.dart';
import 'package:flutter_demo/ui/page/mine.dart';
import 'package:flutter_demo/ui/page/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var _pageList = [
    News(),
    Demo(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('新闻'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('示例'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
