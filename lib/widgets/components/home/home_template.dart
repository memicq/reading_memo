import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/home_bloc.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/resources/models/phrase.dart';
import 'package:reading_memo/styles/color_const.dart';
import 'package:reading_memo/styles/text_style_const.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/home/home_item.dart';
import 'package:reading_memo/widgets/components/home/phrase_addition_button.dart';
import 'package:reading_memo/widgets/components/phrase_addition/phrase_addition_template.dart';
import 'package:reading_memo/widgets/screen/phrase_addition_screen.dart';

class HomeTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
        appBar: BasicAppBar(title: "ホーム"),
        body: StreamBuilder(
          stream: _bloc.phraseInitialStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HomeItemView> views = snapshot.data;
              return Container(
                height: 1000,
                width: double.infinity,
                child: Stack(
                  children: [
                    Scrollbar(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: views.map((view) => HomeItem(itemView: view)).toList(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 15,
                        bottom: 15,
                        child: PhraseAdditionButton(
                          onPressed: () => PhraseAdditionScreen.open(context),
                        )
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
