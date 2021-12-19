import 'package:flutter/material.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tab_page.dart';
import 'package:reading_memo/widgets/components/common/ios_bottom_space.dart';
import 'package:reading_memo/widgets/screens/bookshelf_screen.dart';
import 'package:reading_memo/widgets/screens/setting_screen.dart';
import 'package:reading_memo/widgets/screens/sign_in_screen.dart';
import 'package:reading_memo/widgets/styles/color_const.dart';

class MainLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  bool shouldShowSignInScreen = false;

  int currentPage = 1;
  Map<int, TabPage> pages = {
    1: TabPage(
      title: "本棚",
      baseIcon: Icons.list_alt_outlined,
      activeIcon: Icons.list_alt_rounded,
      screenWidget: BookshelfScreen(),
    ),
    2: TabPage(
      title: "アカウント",
      baseIcon: Icons.account_circle_outlined,
      activeIcon: Icons.account_circle_rounded,
      screenWidget: SettingScreen(),
    )
  };

  void _checkLoginStateAfterBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (shouldShowSignInScreen) SignInScreen.open(context, callback: () {});
    });
  }

  void movePage(int pageNumber) {
    setState(() {
      currentPage = pageNumber;
    });
  }

  Widget buildBottomTabItem(TabPage page, int pageNumber) {
    Icon icon = (pageNumber == this.currentPage)
        ? Icon(page.activeIcon, color: ColorConst.activeColor, size: 23)
        : Icon(page.baseIcon, color: ColorConst.disabledColor, size: 20);

    Text text = (pageNumber == this.currentPage)
        ? Text(
            page.title,
            style: TextStyle(color: FontColorConst.activeColor, fontSize: 10),
          )
        : Text(
            page.title,
            style: TextStyle(color: FontColorConst.disabledColor, fontSize: 10),
          );

    return Expanded(
      child: Container(
        child: TextButton(
          onPressed: () {
            movePage(pageNumber);
          },
          style: ButtonStyle(overlayColor: MaterialStateProperty.all(ColorConst.buttonSplashColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon, SizedBox(height: 5), text],
          ),
        ),
      ),
    );
  }

  Widget buildBottomTab() {
    List<Widget> items = pages.entries.map((entry) {
      return buildBottomTabItem(entry.value, entry.key);
    }).toList();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey)],
      ),
      child: Column(
        children: [
          Container(
            height: 60.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: items,
            ),
          ),
          IosBottomSpace(),
        ],
      ),
    );
  }

  Widget buildLoadingView() {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SessionBloc _bloc = SessionBloc();

    return StreamBuilder<SessionState>(
      stream: _bloc.currentStateStream,
      builder: (BuildContext context, AsyncSnapshot<SessionState> snapshot) {
        _checkLoginStateAfterBuild();
        if (!snapshot.hasData) return Container();

        SessionState _session = snapshot.data;
        shouldShowSignInScreen = _session.shouldShowSignInScreen();
        if (_session.isLoading || _session.user == null) {
          return buildLoadingView();
        } else {
          return Scaffold(
            body: Container(
              child: Center(
                child: Column(
                  children: [
                    Expanded(child: pages[currentPage].screenWidget),
                    buildBottomTab(),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
