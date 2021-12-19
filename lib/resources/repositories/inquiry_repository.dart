import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/inquiry_row.dart';

class InquiryRepository {
  String userId;

  InquiryRepository({@required SessionState session}) {
    this.userId = session.user.userId;
  }

  Future<void> create(InquiryRow inquiry) async {
    final _db = FirebaseFirestore.instance;
    await _db.collection('inquiries').doc().set(inquiry.toMap());
  }
}
