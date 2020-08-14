import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE8EDFC),
      child: Container(
        height: 60,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 26,
              ),
              child: Text(''),
              iconMargin: EdgeInsets.only(top: 13),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 26,
              ),
              child: Text(''),
              iconMargin: EdgeInsets.only(top: 13),
            ),
            Tab(
              icon: Icon(
                Icons.add_circle,
                size: 26,
              ),
              child: Text(''),
              iconMargin: EdgeInsets.only(top: 13),
            ),
            Tab(
              icon: Icon(
                Icons.notifications,
                size: 26,
              ),
              child: Text(''),
              iconMargin: EdgeInsets.only(top: 13),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                size: 26,
              ),
              child: Text(''),
              iconMargin: EdgeInsets.only(top: 13),
            ),
          ],
        ),
      ),
    );
  }
}
