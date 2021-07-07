
import 'dart:convert';

import 'package:http/http.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_request.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_result.dart';

class RakutenBooksRepository {
  // for singleton
  static final RakutenBooksRepository _instance = RakutenBooksRepository._internal();
  factory RakutenBooksRepository() => _instance;
  RakutenBooksRepository._internal() {}

  Future<RakutenBooksSearchApiResult> search(RakutenBooksSearchApiRequest request) async {
    Uri uri = Uri.https(
        RakutenBooksSearchApiRequest.domain, RakutenBooksSearchApiRequest.path,
        request.toQueryParam()
    );
    Response res = await get(uri);

    Map<String, dynamic> map = json.decode(res.body);
    return RakutenBooksSearchApiResult.fromMap(map);
  }
}