import 'package:flutter/material.dart';
import 'package:login/Home/mainPage.dart';
import 'package:login/login/forget_page.dart';
import 'package:login/login/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'voingLogIn',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 140)),
                  Center(
                    child: Text(
                      'voing',
                      style: TextStyle(
                          fontFamily: 'Rochester',
                          letterSpacing: 2.0,
                          fontSize: 60.0),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.transparent,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], fontSize: 15.0))),
                      child: Container(
                        padding: EdgeInsets.only(top: 100),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              height: 50,
                              width: 320,
                              child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ID',
                                  ),
                                  keyboardType: TextInputType.text),
                              decoration: BoxDecoration(
                                  border: new Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              height: 50,
                              width: 320,
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password'),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              decoration: BoxDecoration(
                                  border: new Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                            ),
                            SizedBox(height: 30.0),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 40.0,
                                child: Container(
                                  child: FlatButton(
                                    color: Colors.transparent,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        _signInWithEmailAndPassword();
                                      }
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      border:
                                          new Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13.0))),
                                )),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  child: Text(
                                    '비밀번호 찾기',
                                    style: TextStyle(
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Forget_page()));
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    '/',
                                    style: TextStyle(
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: Text(
                                    '회원가입',
                                    style: TextStyle(
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RegisterPage()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Example code of how to sign in with email and password.
  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => MainPage()));
    } else {
      _success = false;
      showSnackBar(context);
    }
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('아이디, 혹은 비밀번호를 확인하세요', textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
  ));
}
