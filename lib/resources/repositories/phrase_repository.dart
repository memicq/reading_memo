import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reading_memo/resources/models/phrase.dart';

class PhraseRepository {
  // for singleton
  static final PhraseRepository _instance = PhraseRepository._internal();
  factory PhraseRepository() => _instance;
  PhraseRepository._internal() {
    this._initUserDatabase();
  }

  String userId;

  Future<void> _initUserDatabase() async {
    this.userId = null;
  }

  Future<List<Phrase>> list() async {
    final snapshot = await FirebaseFirestore.instance.collection('phrases').get();
    return snapshot.docs.map((doc) => Phrase.fromSnapshot(doc)).toList(growable: false);
  }

  Future<List<Phrase>> listByUserIds(List<String> userIds) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('phrases')
        .where('postedUserId', arrayContains: userIds)
        .get();
    return snapshot.docs.map((doc) => Phrase.fromSnapshot(doc)).toList(growable: false);
  }
}