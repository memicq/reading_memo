import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/enums/login_type.dart';
import 'package:reading_memo/utils/unique_id_util.dart';

class UserRow {
  String userId;
  String email;
  String encryptedPassword;
  String displayName;
  LoginType loginType;
  DateTime createdAt;
  DateTime updatedAt;

  DocumentReference reference;

  UserRow({
    String userId,
    bool generateId = false,
    @required this.email,
    @required this.encryptedPassword,
    @required this.displayName,
    @required this.loginType,
    @required this.createdAt,
    @required this.updatedAt
  }): assert(userId != null || generateId == true) {
    if (userId != null) {
      this.userId = userId;
    } else {
      this.userId = UniqueIdUtil().generateId();
    }
  }

  UserRow.fromMap(Map<String, dynamic> map, {@required this.reference})
      : assert(map['email'] != null),
        assert(map['encryptedPassword'] != null),
        assert(map['displayName'] != null),
        assert(map['loginType'] != null),
        assert(map['createdAt'] != null),
        assert(map['updatedAt'] != null),
        this.userId = reference.id,
        this.email = map['email'],
        this.encryptedPassword = map['encryptedPassword'],
        this.displayName = map['displayName'],
        this.loginType = LoginTypeExt.fromCode(map['loginType']),
        this.createdAt = map['createdAt'].toDate(),
        this.updatedAt = map['updatedAt'].toDate();

  UserRow.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'encryptedPassword': this.encryptedPassword,
      'displayName': this.displayName,
      'loginType': this.loginType.code,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt
    };
  }

  @override
  String toString() => "UserRow<userId=$userId, email=$email>";
}