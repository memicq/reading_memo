import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/home_bloc.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/home/home_item_list.dart';

class HomeTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
        appBar: BasicAppBar(title: "日記"),
        body: StreamBuilder(
          stream: _bloc.homeItemStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            List<HomeItem> items = snapshot.data;
            return HomeItemList(items: items);
          },
        ));
  }
}
