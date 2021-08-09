import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/home_bloc.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/components/home/home_item.dart';
import 'package:reading_memo/widgets/components/home/phrase_addition_button.dart';
import 'package:reading_memo/widgets/screens/phrase_addition_screen.dart';

import 'home_item_list_not_found.dart';

class HomeItemList extends StatelessWidget {
  final List<HomeItem> items;
  HomeItemList({@required this.items});

  Widget buildHomeItemList() {
    if (items.length == 0) {
      return HomeItemListNotFound();
    } else {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: this.items.map((view) =>
              HomeListItem(item: view)
          ).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<HomeBloc>(context);
    return Container(
      height: 1000,
      width: double.infinity,
      child: Stack(
        children: [
          Scrollbar(
            child: SingleChildScrollView(
                child: buildHomeItemList()
            ),
          ),
          Positioned(
              right: 15,
              bottom: 15,
              child: PhraseAdditionButton(
                onPressed: () =>
                    PhraseAdditionScreen.open(
                        context,
                        callback: () => _bloc.fetchHomeItems()
                    ),
              )
          ),
        ],
      ),
    );
  }
}