
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Phrase {
  String phraseId;
  String quotedText;
  String bookId;
  String pageNumber;
  String postedUserId;
  DateTime createdAt;
  DateTime updatedAt;

  DocumentReference reference;

  Phrase.fromMap(Map<String, dynamic> map, {@required this.reference})
      : assert(map['quotedText'] != null),
        assert(map['bookId'] != null),
        assert(map['postedUserId'] != null),
        assert(map['createdAt'] != null),
        assert(map['updatedAt'] != null),
        this.phraseId = reference.id,
        this.quotedText = map['quotedText'],
        this.bookId = map['bookId'],
        this.pageNumber = map['pageNumber'],
        this.postedUserId = map['postedUserId'],
        this.createdAt = map['createdAt'].toDate(),
        this.updatedAt = map['updatedAt'].toDate();

  Phrase.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Phrase<$phraseId:$quotedText:$bookId>";
}