import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/utils/unique_id_util.dart';
import 'package:uuid/uuid_util.dart';

class BookRow {
  String bookId;
  String isbnCode10;
  String isbnCode13;
  String bookTitle;
  List<String> authors;
  String referenceUrl;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  DocumentReference reference;

  BookRow({
    String bookId,
    bool generateId = false,
    String isbnCode10,
    String isbnCode13,
    @required this.bookTitle,
    @required this.authors,
    @required this.referenceUrl,
    @required this.imageUrl,
    @required this.createdAt,
    @required this.updatedAt
  }): assert(bookId != null || generateId == true),
        assert(isbnCode10 != null || isbnCode13 != null),
        this.isbnCode10 = isbnCode10,
        this.isbnCode13 = isbnCode13
  {
    if (bookId != null) {
      this.bookId = bookId;
    } else {
      this.bookId = UniqueIdUtil().generateId();
    }
  }

  BookRow.fromMap(Map<String, dynamic> map, {@required this.reference})
      : assert(map['isbnCode10'] != null || map['isbnCode13'] != null),
        assert(map['bookTitle'] != null),
        assert(map['authors'] != null),
        assert(map['referenceUrl'] != null),
        assert(map['imageUrl'] != null),
        assert(map['createdAt'] != null),
        assert(map['updatedAt'] != null),
        this.bookId = reference.id,
        this.isbnCode10 = map['isbnCode10'],
        this.isbnCode13 = map['isbnCode13'],
        this.bookTitle = map['bookTitle'],
        this.authors = (map['authors'] as String).split(','),
        this.referenceUrl = map['referenceUrl'],
        this.imageUrl = map['imageUrl'],
        this.createdAt = map['createdAt'].toDate(),
        this.updatedAt = map['updatedAt'].toDate();

  BookRow.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> toMap() {
    return {
      'isbnCode10': this.isbnCode10,
      'isbnCode13': this.isbnCode13,
      'bookTitle': this.bookTitle,
      'authors': this.authors.join(','),
      'referenceUrl': this.referenceUrl,
      'imageUrl': this.imageUrl,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt
    };
  }

  @override
  String toString() => 'BookRow<$bookId:$bookTitle>';
}