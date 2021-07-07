class UserRepository {
  // for singleton
  static final UserRepository _instance = UserRepository._internal();
  factory UserRepository() => _instance;
  UserRepository._internal() {
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