enum InquiryType {
  QUESTION,
  REQUEST,
  REPORT_BUG,
  OTHER,
}

extension InquiryTypeExt on InquiryType {
  static final codes = {
    InquiryType.QUESTION: 'Question',
    InquiryType.REQUEST: 'Request',
    InquiryType.REPORT_BUG: 'ReportBug',
    InquiryType.OTHER: 'Other',
  };

  static final japaneseNames = {
    InquiryType.QUESTION: '質問',
    InquiryType.REQUEST: '要望',
    InquiryType.REPORT_BUG: 'バグ報告',
    InquiryType.OTHER: 'その他',
  };

  String get code => InquiryTypeExt.codes[this];

  String get japaneseName => InquiryTypeExt.japaneseNames[this];
}
