import 'package:flutter/material.dart';
import 'signpw.dart';

class Forget_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 200),
          Center(
            child: Text(
              'New password',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          SizedBox(height: 100),
          email('Your e-mail address'),
          SizedBox(height: 20),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.black)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => signpw()));
            },
            child: Text('Send',
                style: TextStyle(fontSize: 17, color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget email(String txt) {
    return Container(
      width: 300,
      height: 40,
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.black)),
      // margin: EdgeInsets.all(10.0),
      child: Row(children: <Widget>[
        Container(
          width: 200,
          child: Text(txt, style: TextStyle(fontSize: 16, color: Colors.grey)),
        ),
      ]),
    );
  }
}
