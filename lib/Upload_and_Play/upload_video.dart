import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:login/Upload_and_Play/play_video_net.dart';
import 'package:login/Upload_and_Play/references.dart';

CloudStorageDemoState pageState;
String _uploadedUrl = "";
int idx = 0;

class CloudStorageDemo extends StatefulWidget {
  @override
  CloudStorageDemoState createState() {
    pageState = CloudStorageDemoState();
    return pageState;
  }
}

class CloudStorageDemoState extends State<CloudStorageDemo> {
  File _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser _user;
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.primaries[0],
    ),
    Container(
      color: Colors.primaries[1],
    ),
    Container(
      color: Colors.primaries[2],
    ),
    Container(
      color: Colors.primaries[3],
    ),
    Container(
      color: Colors.primaries[4],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _prepareService();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("영상 업로드")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("갤러리"),
                  onPressed: () {
                    _uploadToStorage(ImageSource.gallery);
                  },
                ),
                RaisedButton(
                  child: Text("카메라"),
                  onPressed: () {
                    _uploadToStorage(ImageSource.camera);
                  },
                )
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            RaisedButton(
                child: Text('Play!'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      // return VideoApp();
                      return VideoApp();
                    }),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('업로드된 링크 : ' + _uploadedUrl),
            )
            // BottomNavigationBar(items: navBar,)
          ],
        ),
      ),
    );
  }

  void _uploadToStorage(ImageSource source) async {
    // final DateTime now = DateTime.now();
    // final String month = now.month.toString();
    // final String date = now.day.toString();
    // final String hour = now.hour.toString();
    // final String minute = now.minute.toString();
    // final String second = now.second.toString();
    // final String uploadTime = ('$month월$date일 $hour:$minute:$second');

    // ignore: deprecated_member_use
    final file = await ImagePicker.pickVideo(source: source);

    if (file == null) return;
    setState(() {
      _image = file;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("videos")
        .child('${_user.uid}')
        // .child(uploadTime);
        .child('$idx');
    StorageUploadTask uploadTask =
        ref.putFile(file, StorageMetadata(contentType: 'video/mp4'));

    await uploadTask.onComplete;

    String downloadUrl = await ref.getDownloadURL();

    final String url = downloadUrl.toString();

    setState(() {
      _uploadedUrl = url;
      _saveRef(ref);
    });
    idx++;
    print(url);
  }

  void _saveRef(StorageReference newRef) {
    savedRef.add(newRef);
  }
}
