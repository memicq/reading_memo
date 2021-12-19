import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/inquiry_bloc.dart';
import 'package:reading_memo/resources/models/enums/inquiry_type.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

import 'inquiry_bottom_bar.dart';

class InquiryTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InquiryTemplateState();
}

class InquiryTemplateState extends State<InquiryTemplate> {
  final Color _formBackgroundColor = Color(0xFFF5F5F5);

  bool _isInquiryTypeInitialState = true;
  InquiryType _inquiryType;

  bool _isTitleInitialState = true;
  String _title;

  bool _isContentInitialState = true;
  String _content;

  final List<DropdownMenuItem<InquiryType>> _inquiryTypeOptions = InquiryType.values
      .map(
        (type) => DropdownMenuItem(
          child: Text(type.japaneseName),
          value: type,
        ),
      )
      .toList();

  void onTapInquiryTypeDropdown() {
    setState(() => _isInquiryTypeInitialState = false);
  }

  void onTapTitleTextField() {
    setState(() => _isTitleInitialState = false);
  }

  void onTapContentTextField() {
    setState(() => _isContentInitialState = false);
  }

  void onChangeInquiryTypeDropdown(InquiryType inquiryType, InquiryBloc bloc) {
    setState(() => _inquiryType = inquiryType);
    bloc.updateInquiryType(inquiryType);
  }

  void onChangeTitleTextField(String title, InquiryBloc bloc) {
    setState(() => _title = title);
    bloc.updateTitle(title);
  }

  void onChangeContentTextField(String content, InquiryBloc bloc) {
    setState(() => _content = content);
    bloc.updateContent(content);
  }

  String validateInquiryTypeDropdown() {
    if (!_isInquiryTypeInitialState && _inquiryType == null)
      return "タイプを入力してください";
    else
      return null;
  }

  String validateTitleTextField() {
    if (!_isTitleInitialState && (_title == null || _title == ''))
      return "用件を入力してください";
    else
      return null;
  }

  String validateContentTextField() {
    if (!_isContentInitialState && (_content == null || _content == ''))
      return "内容を入力してください";
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    InquiryBloc _bloc = Provider.of<InquiryBloc>(context);

    return Scaffold(
      appBar: BasicAppBar(
        title: "お問い合わせ",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    value: _inquiryType,
                    items: _inquiryTypeOptions,
                    onChanged: (value) => onChangeInquiryTypeDropdown(value, _bloc),
                    onTap: () => onTapInquiryTypeDropdown(),
                    decoration: InputDecoration(
                      labelText: 'タイプ *',
                      filled: true,
                      fillColor: _formBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      errorText: validateInquiryTypeDropdown(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextField(
                    onChanged: (value) => onChangeTitleTextField(value, _bloc),
                    onTap: () => onTapTitleTextField(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: _formBackgroundColor,
                      labelText: '用件 *',
                      hintText: '',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      errorText: validateTitleTextField(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextField(
                    onTap: () => onTapContentTextField(),
                    onChanged: (value) => onChangeContentTextField(value, _bloc),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 15,
                    decoration: InputDecoration(
                      labelText: '内容 *',
                      hintText: '',
                      filled: true,
                      fillColor: _formBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      errorText: validateContentTextField(),
                    ),
                  ),
                ),
              ],
            ),
            InquiryBottomBar(),
          ],
        ),
      ),
    );
  }
}
