import 'package:flutter/foundation.dart';

class HomeItem {
  String phraseId;
  String quotedText;
  String bookTitle;
  String imageUrl;
  List<String> authorNames;
  DateTime createdAt;

  String postedUserId;
  String postedUserName;
  String postedUserDisplayName;

  HomeItem({
    @required this.phraseId,
    @required this.quotedText,
    @required this.bookTitle,
    @required this.imageUrl,
    @required this.authorNames,
    @required this.createdAt,
    @required this.postedUserId,
    @required this.postedUserName,
    @required this.postedUserDisplayName
  });

  @override
  String toString() => 'HomeItem<phraseId=$phraseId, quotedText=$quotedText, bookTitle=$bookTitle>';
}