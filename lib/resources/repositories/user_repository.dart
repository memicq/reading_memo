import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';

class UserRepository {
  // for singleton
  static final UserRepository _instance = UserRepository._internal();
  factory UserRepository() => _instance;
  UserRepository._internal();

  Future<void> create(UserRow user) async {
    final _db = FirebaseFirestore.instance;
    await _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<UserRow> get(String userId) async {
    final _db = FirebaseFirestore.instance;
    DocumentSnapshot userDs = await _db.collection('users').doc(userId).get();
    return UserRow.fromSnapshot(userDs);
  }

  Future<UserRow> getByEmail(String email) async {
    final _db = FirebaseFirestore.instance;
    QuerySnapshot qs = await _db.collection('users').where('email', isEqualTo: email).limit(1).get();
    return qs.docs.isNotEmpty ? UserRow.fromSnapshot(qs.docs.single) : null;
  }
}