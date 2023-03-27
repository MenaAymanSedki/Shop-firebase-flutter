import 'package:app_commerce/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStroeUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
  Future<DocumentSnapshot> getCurrentUser (String uid) async{
    return await _userCollectionRef.doc(uid).get();
  }
}
