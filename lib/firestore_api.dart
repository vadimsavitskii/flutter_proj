
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {
  FirebaseFirestore firestore;

  init() {
    firestore = FirebaseFirestore.instance;
  }

  Future<DocumentReference> addData(Map<String, dynamic> data) async {
    init();
    DocumentReference ref = await firestore.collection('calculations').add(data);
    return ref;
  }

  Future<List<Map<String, dynamic>>> readAllData() async {
    init();
    QuerySnapshot snapshot = await firestore.collection('calculations').get();
    List<Map<String, dynamic>> calculations = snapshot.docs.map<Map<String, dynamic>>((e) => e.data()).toList();
    return calculations;
  }


  Future getPosts() async {
    init();
    QuerySnapshot qn = await firestore.collection('calculations').get();
    return qn.docs;
  }


  //  To delete all documents in collection of firebase (just for testing),
  //  add in queryrows foreach loop in mainpage.dart this:
  //  FirestoreApi().deleteData(calculation.toJson());
  Future<DocumentReference> deleteData(Map<String, dynamic> data) async {
    init();
    // ignore: missing_return
    DocumentReference ref = await firestore.collection('calculations').get().then((value){
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection('calculations').doc(element.id).delete().then((value){
          print('Value deleted, proceeding...');
        });
      });
    });
    return ref;
  }
}