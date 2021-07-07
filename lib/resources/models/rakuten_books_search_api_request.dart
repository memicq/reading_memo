class RakutenBooksSearchApiRequest {
  static String domain = "app.rakuten.co.jp";
  static String path = "/services/api/BooksBook/Search/20170404";

  String _applicationId = "1085577155712228789";

  String query;
  String _title;
  String _author;
  String _isbn;

  RakutenBooksSearchApiRequest.fromQuery(String query)
      : assert(query != null),
        this.query = query
  {
    _classifyQuery();
  }

  void _classifyQuery() {
    bool _isIsbn10 = new RegExp(r'[0-9]{10}').hasMatch(this.query);
    bool _isIsbn13 = new RegExp(r'[0-9]{13}').hasMatch(this.query);

    if (_isIsbn10 || _isIsbn13) {
      this._isbn = this.query;
    } else {
      this._title = this.query;
    }
  }

  Map<String, String> toQueryParam() {
    Map<String, String> map = { "applicationId": this._applicationId };

    if (this._title != null) map.addAll({ "title": this._title });
    if (this._author != null) map.addAll({ "author": this._author });
    if (this._isbn != null) map.addAll({ "isbn": this._isbn });

    return map;
  }
}