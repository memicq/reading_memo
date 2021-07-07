import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/resources/models/phrase.dart';
import 'package:reading_memo/resources/repositories/phrase_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  PhraseRepository _phraseRepository = PhraseRepository();

  final _phraseInitialPublishSubject = PublishSubject<List<HomeItemView>>();

  HomeBloc() {
    fetchPhrases();
  }

  Stream<List<HomeItemView>> get phraseInitialStream => _phraseInitialPublishSubject.stream;
  Sink<List<HomeItemView>> get phraseInitialSink => _phraseInitialPublishSubject.sink;

  void fetchPhrases() async {
    final _phrases = await _phraseRepository.list();
    final _homeItemViews = _phrases.map((phrase) =>
        HomeItemView(
            phraseId: phrase.phraseId,
            quotedText: phrase.quotedText,
            bookTitle: "タイトル",
            authorName: "著者名",
            createdAt: phrase.createdAt,
            postedUserId: phrase.postedUserId,
            postedUserName: "username",
            postedUserDisplayName: "Display Name"
        )
    ).toList();
    phraseInitialSink.add(_homeItemViews);
  }

  void dispose() {
    _phraseInitialPublishSubject.close();
  }
}