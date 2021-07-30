import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bikeMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(bikeData) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('bikes')
          .add(bikeData)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to be signed in');
    }
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection('bikes')
        .orderBy("time", descending: true)
        .get();
  }

  updateData(selectedDoc, newValue) {
    FirebaseFirestore.instance
        .collection('bikes')
        .doc(selectedDoc)
        .update(newValue)
        .catchError((e) {
      print(e);
    });
  }

  deleteData(docId) {
    FirebaseFirestore.instance
        .collection('bikes')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
