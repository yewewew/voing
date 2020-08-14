import 'package:flutter/material.dart';
import 'package:login/Cam/play_ready_page.dart';
import 'package:login/Upload_and_Play/upload_video.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    CloudStorageDemo(),
    PlayReady(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[900],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(icon1: Icon(Icons.home)),
          _buildBottomNavigationBarItem(icon1: Icon(Icons.search)),
          _buildBottomNavigationBarItem(icon1: Icon(Icons.add_circle)),
          _buildBottomNavigationBarItem(icon1: Icon(Icons.notifications)),
          _buildBottomNavigationBarItem(icon1: Icon(Icons.person)),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({Icon icon1}) {
    return BottomNavigationBarItem(
      icon: icon1,
      title: Text(''),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
