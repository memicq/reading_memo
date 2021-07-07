import 'package:flutter/foundation.dart';

class HomeItemView {
  String phraseId;
  String quotedText;
  String bookTitle;
  String authorName;
  DateTime createdAt;

  String postedUserId;
  String postedUserName;
  String postedUserDisplayName;

  HomeItemView({
    @required this.phraseId,
    @required this.quotedText,
    @required this.bookTitle,
    @required this.authorName,
    @required this.createdAt,
    @required this.postedUserId,
    @required this.postedUserName,
    @required this.postedUserDisplayName
  });
}