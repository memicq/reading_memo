
class RakutenBooksSearchApiResult {
  // 全体情報
  int count;
  int page;
  int first;
  int last;
  int hits;
  int carrier; // 0:PC, 1:mobile
  int pageCount;

  // 商品情報
  List<RakutenBooksSearchApiResultItem> items;

  RakutenBooksSearchApiResult.fromMap(Map<String, dynamic> map)
      : this.count = map['count'],
        this.page = map['page'],
        this.first = map['first'],
        this.last = map['last'],
        this.hits = map['hits'],
        this.carrier = map['carrier'],
        this.pageCount = map['pageCount'],
        this.items = (map['Items'] as List<dynamic>).map((item) => new RakutenBooksSearchApiResultItem.fromMap(item['Item'])).toList();

  @override
  String toString() => "RakutenBooksApiResult<$count:$page:$first:$last:$hits:$carrier:$pageCount:$items>";
}

class RakutenBooksSearchApiResultItem {
  String title;
  String titleKana;
  String subTitle;
  String subTitleKana;
  String seriesName;
  String seriesNameKana;
  String contents;
  String contentsKana;
  String author;
  String authorKana;
  String publisherName;
  String size;
  String isbn;
  String itemCaption;
  String salesDate;
  int itemPrice;
  int listPrice;
  int discountRate;
  int discountPrice;
  String itemUrl;
  String affiliateUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String chirayomiUrl;
  String availability;
  int postageFlag;
  int limitedFlag;
  int reviewCount;
  String reviewAverage;
  String booksGenreId;

  RakutenBooksSearchApiResultItem.fromMap(Map<String, dynamic> map)
      : this.title = map['title'],
        this.titleKana = map['titleKana'],
        this.subTitle = map['subTitle'],
        this.subTitleKana = map['subTitleKana'],
        this.seriesName = map['seriesName'],
        this.seriesNameKana = map['seriesNameKana'],
        this.contents = map['contents'],
        this.contentsKana = map['contentsKana'],
        this.author = map['author'],
        this.authorKana = map['authorKana'],
        this.publisherName = map['publisherName'],
        this.size = map['size'],
        this.isbn = map['isbn'],
        this.itemCaption = map['itemCaption'],
        this.salesDate = map['salesDate'],
        this.itemPrice = map['itemPrice'],
        this.listPrice = map['listPrice'],
        this.discountRate = map['discountRate'],
        this.discountPrice = map['discountPrice'],
        this.itemUrl = map['itemUrl'],
        this.affiliateUrl = map['affiliateUrl'],
        this.smallImageUrl = map['smallImageUrl'],
        this.mediumImageUrl = map['mediumImageUrl'],
        this.largeImageUrl = map['largeImageUrl'],
        this.chirayomiUrl = map['chirayomiUrl'],
        this.availability = map['availability'],
        this.postageFlag = map['postageFlag'],
        this.limitedFlag = map['limitedFlag'],
        this.reviewCount = map['reviewCount'],
        this.reviewAverage = map['reviewAverage'],
        this.booksGenreId = map['booksGenreId'];

  @override
  String toString() => "RakutenBooksApiResultItem<$title:$author:$publisherName:$isbn>";
}
