import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<StorageReference> savedRef = List();
FirebaseUser _user;
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future getRef() async {
  _prepareService();

  int index = 0;

  StorageReference ref = FirebaseStorage.instance
      .ref()
      .child("videos")
      .child('${_user.uid}')
      .child('$index');

  while (ref.child('$index') != null) {
    savedRef.add(ref.child('$index'));
    index++;
  }
}

void _prepareService() async {
  _user = await _firebaseAuth.currentUser();
}
