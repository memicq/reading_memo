import 'package:reading_memo/blocs/bloc_base.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/resources/repositories/book_repository.dart';
import 'package:rxdart/rxdart.dart';

class BookshelfBloc extends BlocBase {
  BookRepository _bookRepository;

  BookshelfBloc() : super() {
    _bookRepository = BookRepository(session: super.session);
    fetchBooks();
  }

  PublishSubject _booksPublishSubject = PublishSubject<List<BookRow>>();
  Stream<List<BookRow>> get booksStream => _booksPublishSubject.stream;

  Future<void> fetchBooks() async {
    List<BookRow> books = await _bookRepository.list();
    _booksPublishSubject.sink.add(books);
  }

  void dispose() {
    _booksPublishSubject.close();
  }
}
