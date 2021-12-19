import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:reading_memo/resources/models/enums/inquiry_type.dart';

class InquiryRow {
  InquiryType _type;
  String _title;
  String _content;
  String userId;
  DateTime createdAt;

  bool _canSubmit = false;

  DocumentReference reference;

  InquiryRow({
    @required this.userId,
    @required this.createdAt,
  });

  bool get canSubmit => this._canSubmit;

  set inquiryType(InquiryType type) {
    this._type = type;
    _updateCanSubmit();
  }

  set title(String title) {
    this._title = title;
    _updateCanSubmit();
  }

  set content(String content) {
    this._content = content;
    _updateCanSubmit();
  }

  void _updateCanSubmit() {
    this._canSubmit = this._type != null &&
        (this._title != null && this._title != '') &&
        (this._content != null && this._content != '') &&
        this.userId != null;
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this._type.code,
      'title': this._title,
      'content': this._content,
      'userId': this.userId,
      'createdAt': Timestamp.fromDate(this.createdAt),
    };
  }
}
