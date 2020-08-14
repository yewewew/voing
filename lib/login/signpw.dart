import 'package:flutter/material.dart';

class signpw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
          SizedBox(height:320),
      Center(
        child: Text('Please sign in with your new password!',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black
          ),),
      ),]
      )
    );
  }
}
