import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/enums/inquiry_type.dart';
import 'package:reading_memo/resources/models/tables/inquiry_row.dart';
import 'package:reading_memo/resources/repositories/inquiry_repository.dart';
import 'package:rxdart/rxdart.dart';

class InquiryBloc {
  InquiryRepository _inquiryRepository;

  InquiryRow _inquiryRow;

  // ps
  final PublishSubject<InquiryRow> _inquiryPs = PublishSubject<InquiryRow>();

  Stream<InquiryRow> get inquiryStream => _inquiryPs.stream;

  InquiryBloc() {
    SessionBloc _session = SessionBloc();
    _inquiryRepository = InquiryRepository(session: _session.currentState);
    _inquiryRow = InquiryRow(
      userId: _session.currentState.user.userId,
      createdAt: DateTime.now(),
    );
  }

  void updateTitle(String title) {
    _inquiryRow.title = title;
    _inquiryPs.sink.add(_inquiryRow);
  }

  void updateContent(String content) {
    _inquiryRow.content = content;
    _inquiryPs.sink.add(_inquiryRow);
  }

  void updateInquiryType(InquiryType type) {
    _inquiryRow.inquiryType = type;
    _inquiryPs.sink.add(_inquiryRow);
  }

  Future<void> submit() async {
    await _inquiryRepository.create(_inquiryRow);
  }

  void dispose() {
    _inquiryPs.close();
  }
}
