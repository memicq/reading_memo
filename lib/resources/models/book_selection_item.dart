import 'package:flutter/cupertino.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_result.dart';

class BookSelectionItem {
  String title;
  String titleKana;
  String subTitle;
  String subTitleKana;
  String seriesName;
  String seriesNameKana;
  String author;
  String authorKana;
  String publisherName;
  String isbn;
  String itemUrl;
  String affiliateUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String booksGenreId;

  BookSelectionItem({
    @required this.title,
    @required this.titleKana,
    @required this.subTitle,
    @required this.subTitleKana,
    @required this.seriesName,
    @required this.seriesNameKana,
    @required this.author,
    @required this.authorKana,
    @required this.publisherName,
    @required this.isbn,
    @required this.itemUrl,
    @required this.affiliateUrl,
    @required this.smallImageUrl,
    @required this.mediumImageUrl,
    @required this.largeImageUrl,
    @required this.booksGenreId
  });

  BookSelectionItem.fromRakutenBooksSearchApiResultItem(RakutenBooksSearchApiResultItem item)
      : assert(item.title != null), assert(item.titleKana != null),
        assert(item.subTitle != null), assert(item.subTitleKana != null),
        assert(item.seriesName != null), assert(item.seriesNameKana != null),
        assert(item.author != null), assert(item.authorKana != null),
        assert(item.publisherName != null),
        assert(item.isbn != null),
        assert(item.itemUrl != null), assert(item.affiliateUrl != null),
        assert(item.smallImageUrl != null), assert(item.mediumImageUrl != null), assert(item.largeImageUrl != null),
        assert(item.booksGenreId != null),
        this.title = item.title, this.titleKana = item.titleKana,
        this.subTitle = item.subTitle, this.subTitleKana = item.subTitleKana,
        this.seriesName = item.seriesName, this.seriesNameKana = item.seriesNameKana,
        this.author = item.author, this.authorKana = item.authorKana,
        this.publisherName = item.publisherName,
        this.isbn = item.isbn,
        this.itemUrl = item.itemUrl, this.affiliateUrl = item.affiliateUrl,
        this.smallImageUrl = item.smallImageUrl, this.mediumImageUrl = item.mediumImageUrl, this.largeImageUrl = item.largeImageUrl,
        this.booksGenreId = item.booksGenreId;
}