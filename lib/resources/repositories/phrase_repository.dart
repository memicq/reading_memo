import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/resources/models/tables/phrase_row.dart';
import 'package:reading_memo/utils/list_util.dart';

class PhraseRepository {
  String userId;

  PhraseRepository({@required SessionState session}) {
    this.userId = session.user.userId;
  }

  Future<void> create(PhraseRow phrase, BookRow book) async {
    final _db = FirebaseFirestore.instance;

    _db.runTransaction((transaction) async {
      DocumentReference _bookDoc =
          await _db.collection('books').doc(book.bookId);
      transaction.set(_bookDoc, book.toMap());

      DocumentReference _phraseDoc =
          await _db.collection('phrases').doc(phrase.phraseId);
      transaction.set(_phraseDoc, phrase.toMap());
    });
  }

  /// return List of {'phrase': [Phrase class], 'book': [Book class]}
  Future<List<Map<String, dynamic>>> list(String userId) async {
    final _db = FirebaseFirestore.instance;

    QuerySnapshot _phraseQs = await _db
        .collection('phrases')
        .where('postedUserId', isEqualTo: userId)
        .get();
    List<PhraseRow> phrases =
        _phraseQs.docs.map((doc) => PhraseRow.fromSnapshot(doc)).toList();
    phrases.sort((p1, p2) => p1.createdAt.isBefore(p2.createdAt) ? 1 : -1);

    List<String> bookIds = phrases.map((phrase) => phrase.bookId).toList();
    List<List<String>> chunkedBookIds = ListUtil.chunk<String>(bookIds, 10);

    List<BookRow> books = List.empty(growable: true);
    await Future.forEach(chunkedBookIds, (bookIds) async {
      QuerySnapshot _bookQs = await _db
          .collection('books')
          .where(FieldPath.documentId, whereIn: bookIds)
          .get();
      books.addAll(
          _bookQs.docs.map((doc) => BookRow.fromSnapshot(doc)).toList());
    });

    return phrases
        .map((phrase) => {
              'phrase': phrase,
              'book': books.singleWhere((b) => b.bookId == phrase.bookId)
            })
        .toList();
  }

  Future<List<PhraseRow>> listByUserIds(List<String> userIds) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('phrases')
        .where('postedUserId', arrayContains: userIds)
        .get();
    return snapshot.docs
        .map((doc) => PhraseRow.fromSnapshot(doc))
        .toList(growable: false);
  }
}
