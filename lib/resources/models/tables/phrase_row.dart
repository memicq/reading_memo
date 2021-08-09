
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/utils/unique_id_util.dart';

class PhraseRow {
  String phraseId;
  String quotedText;
  String bookId;
  String pageNumber;
  String postedUserId;
  DateTime createdAt;
  DateTime updatedAt;

  DocumentReference reference;

  PhraseRow({
    String phraseId,
    bool generateId = false,
    @required this.quotedText,
    @required this.bookId,
    @required this.pageNumber,
    @required this.postedUserId,
    @required this.createdAt,
    @required this.updatedAt
  }): assert(bookId != null || generateId == true) {
    if (phraseId != null) {
      this.phraseId = phraseId;
    } else {
      this.phraseId = UniqueIdUtil().generateId();
    }
  }

  PhraseRow.fromMap(Map<String, dynamic> map, {@required this.reference})
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

  PhraseRow.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> toMap() {
    return {
      'quotedText': this.quotedText,
      'bookId': this.bookId,
      'pageNumber': this.pageNumber,
      'postedUserId': this.postedUserId,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt
    };
  }

  @override
  String toString() => "PhraseRow<$phraseId:$quotedText:$bookId>";
}