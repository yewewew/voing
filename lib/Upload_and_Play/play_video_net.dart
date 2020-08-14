import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:login/Upload_and_Play/references.dart';

VideoAppState playState;
FirebaseUser _user;
String playingUrl = '';

class VideoApp extends StatefulWidget {
  @override
  VideoAppState createState() {
    playState = VideoAppState();
    return playState;
  }
}

class VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    _prepareService();
    _printURL();
    _controller = VideoPlayerController.network(playingUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '영상 재생',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Play View"),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Center(
              // child: ButtonTheme(
              //     buttonColor: Colors.transparent,
              //     height: 0.0,
              //     minWidth: 0.0,
              //     child: RaisedButton(
              //       // padding: EdgeInsets.all(60.0),
              //       textColor: Colors.white,
              //       onPressed: () {
              //         // Wrap the play or pause in a call to `setState`. This ensures the
              //         // correct icon is shown.
              //         setState(() {
              //           // If the video is playing, pause it.
              //           if (_controller.value.isPlaying) {
              //             _controller.pause();
              //           } else {
              //             // If the video is paused, play it.
              //             _controller.play();
              //           }
              //         });
              //       },
              //       child: Icon(
              //         _controller.value.isPlaying
              //             ? Icons.pause
              //             : Icons.play_arrow,
              //         size: 40.0,
              //       ),
              //     )
              //     )
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            )
          ],
          //   child: _controller.value.initialized
          //       ? AspectRatio(
          //           aspectRatio: _controller.value.aspectRatio,
          //           child: VideoPlayer(_controller),
          //         )
          //       : Container(),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       _controller.value.isPlaying
          //           ? _controller.pause()
          //           : _controller.play();
          //     });
          //   },
          //   child: Icon(
          //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          //   ),
        ),
      ),
    );
  }

  void _printURL() async {
    for (StorageReference receivedRef in savedRef) {
      String url = await receivedRef.getDownloadURL();

      setState(() {
        playingUrl = url;
      });
    }

    // FirebaseStorage _firebaseSto = FirebaseStorage.instance;
    // StorageReference storageReference =
    //     _firebaseSto.ref().child('videos/${_user.uid}');
    // String dURL = await storageReference.getDownloadURL();

    print('WOWOWOWOWOWOWOWOWOWOWOWOWWOW' + playingUrl);
  }
}
