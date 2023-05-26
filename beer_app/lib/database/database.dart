import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore db;

  Database() : db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> read() async {
    final result = db.collection("beers").doc('ratings').get();
    final data = result.then((value) => value.data());
    return data;
  }

  Future<void> write(MapEntry<String, int> rating) async {
    var collection = FirebaseFirestore.instance.collection('beers');
    collection
        .doc('ratings')
        .update({rating.key: rating.value}) // <-- Updated data
        .then((_) => print('Success'));
  }
}
