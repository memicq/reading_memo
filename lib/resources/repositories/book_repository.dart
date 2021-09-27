import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';

class BookRepository {
  String userId;

  BookRepository({@required SessionState session}) {
    this.userId = session.user.userId;
  }

  Future<List<BookRow>> list() async {
    final snapshot = await FirebaseFirestore.instance.collection("books").get();
    return snapshot.docs
        .map((doc) => BookRow.fromSnapshot(doc))
        .toList(growable: false);
  }
}
