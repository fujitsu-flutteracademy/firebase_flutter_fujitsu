import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/models/user_model.dart';

class FirestoreDatabaseUsers {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = "USERS";
  Future<void> createNewUser(
      {required String uidUser,
      required String nameUser,
      required String email,
      required bool isAdmin}) async {
    try {
      await _firestore.collection(_collection).doc(uidUser).set(
        {
          "uid": uidUser,
          "name": nameUser,
          "email": email,
          "isAdmin": isAdmin,
        },
        SetOptions(merge: true),
      );
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> editUser({required String uuid, required String desc}) async {
    try {
      await _firestore.collection(_collection).doc(uuid).update({
        'desc2': desc,
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<UserModel?> getUserById({required String uid}) async {
    final querySnapshot = await _getUserByIdFirebase(uid: uid);
    final users =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return users.isEmpty ? null : users.first;
  }

  Future<QuerySnapshot<UserModel>> _getUserByIdFirebase(
      {required String uid}) async {
    return await _firestore
        .collection(_collection)
        .where('uid', isEqualTo: uid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (newUserModel, _) => newUserModel.toJson(),
        )
        .get();
  }
}
