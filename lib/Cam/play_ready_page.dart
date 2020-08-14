import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/Cam/feed_detail.dart';

class PlayReady extends StatefulWidget {
  @override
  _PlayReadyState createState() => _PlayReadyState();
}

class _PlayReadyState extends State<PlayReady> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Text(
                "비디오 리스트 플레이 예제",
                style: TextStyle(
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        side: BorderSide(color: Colors.black45, width: 1)),
                    color: Colors.white,
                    onPressed: _start,
                    minWidth: 240,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Text(
                      "시작하기",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  void _start() async {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PlayPage(),
      ),
    );
  }
}
