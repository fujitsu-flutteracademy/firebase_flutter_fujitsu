import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServicesBikes {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = "BIKES";

  Future<void> createNewBike({
    required String uidBike,
    required String nameBike,
    required String typeBike,
    required String descriptionBike,
  }) async {
    try {
      await _firestore.collection(_collection).doc(uidBike).set(
        {
          "uid": uidBike,
          "name": nameBike,
          "type": typeBike,
          "desption": descriptionBike,
        },
        SetOptions(merge: true),
      );
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
