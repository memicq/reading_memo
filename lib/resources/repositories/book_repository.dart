import 'package:cloud_firestore/cloud_firestore.dart';

class BookRepository {
  // for singleton
  static final BookRepository _instance = BookRepository._internal();
  factory BookRepository() => _instance;
  BookRepository._internal() {
    this._initUserDatabase();
  }

  String userId;

  Future<void> _initUserDatabase() async {
    this.userId = null;
  }

//  Future<List<Book>> list() async {
//    final snapshot = await FirebaseFirestore.instance.collection("books").get();
//    return snapshot.docs.map((doc) => Book.fromSnapshot(doc)).toList(growable: false);
//  }
}