import 'package:flutter/material.dart';
import 'package:login/Upload_and_Play/playByURL.dart';
import 'package:login/Upload_and_Play/upload_video.dart';
import 'package:login/bottom.dart';

void pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              CloudStorageDemo(),
              PlayPage(),
              Container(
                child: Center(
                  child: FlatButton(
                    child: Text('123'),
                    onPressed: () {
                      pushPage(context, PlayPage());
                    },
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Notification Page'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('My Page'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
