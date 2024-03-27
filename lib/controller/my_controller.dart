import 'package:cloud_firestore/cloud_firestore.dart';

class MyController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  Future addData({
    required String name,
  }) async {
    userCollection.add({"name": name});
  }

  Future editData({
    required String id,
    required String name,
  }) async {
    userCollection.doc(id).update({"name": name});
  }

  Future deleteData({required String id}) async {
    userCollection.doc(id).delete();
  }
}
