import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/session_bloc.dart';
import 'package:reading_memo/resources/models/ios_machine_identifier.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tab_page.dart';
import 'package:reading_memo/widgets/screens/account_screen.dart';
import 'package:reading_memo/widgets/screens/bookshelf_screen.dart';
import 'package:reading_memo/widgets/screens/home_screen.dart';
import 'package:reading_memo/widgets/screens/sign_in_screen.dart';
import 'package:reading_memo/widgets/styles/color_const.dart';

class MainLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout>{
  bool _needBottomSpace = true;
  bool shouldShowSignInScreen = false;

  int currentPage = 0;
  Map<int, TabPage> pages = {
    0: TabPage(
        title: "ホーム",
        baseIcon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        screenWidget: HomeScreen()
    ),
    1: TabPage(
        title: "本棚",
        baseIcon: Icons.book_outlined,
        activeIcon: Icons.book_rounded,
        screenWidget: BookshelfScreen()
    ),
    2: TabPage(
        title: "アカウント",
        baseIcon: Icons.account_circle_outlined,
        activeIcon: Icons.account_circle_rounded,
        screenWidget: AccountScreen()
    )
  };

  @override
  void initState() {
    super.initState();
    this._init();
  }

  Future<void> _init() async {
    await _fetchDeviceInfo();
  }

  Future<void> _fetchDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    String machineIdentifier = iosInfo.utsname.machine;
    IosMachineIdentifier machineVer = IosMachineIdentifierExt.from(machineIdentifier);
    setState(() {
      this._needBottomSpace = machineVer.existBottomBar();
    });
  }

  void _checkLoginStateAfterBuild() {
    print('MainLayout._checkLoginStateAfterBuild - ${shouldShowSignInScreen}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (shouldShowSignInScreen) SignInScreen.open(context, callback: (){});
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
        ? Text(page.title, style: TextStyle(color: FontColorConst.activeColor, fontSize: 10))
        : Text(page.title, style: TextStyle(color: FontColorConst.disabledColor, fontSize: 10));

    return Expanded(
        child: Container(
            child: TextButton(
              onPressed: (){ movePage(pageNumber); },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(ColorConst.buttonSplashColor)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(height: 5),
                  text
                ],
              ),
            )
        )
    );
  }

  Widget buildBottomTab() {
    List<Widget> items = pages.entries.map((entry) {
      return buildBottomTabItem(entry.value, entry.key);
    }).toList();

    double bottomSpacePx = (this._needBottomSpace) ? 20.0 : 0.0;
    double heightPx = 60.0 + bottomSpacePx;

    return Container(
      padding: EdgeInsets.only(bottom: bottomSpacePx),
      height: heightPx,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey
          )
        ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: items,
      ),
    );
  }

  Widget buildNotLoggedInView() {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("You're not logged in."),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SessionBloc _bloc = Provider.of<SessionBloc>(context);

    return StreamBuilder<SessionState>(
        stream: _bloc.currentStateStream,
        // initialData: SessionState(msg: 'initialData'),
        builder: (BuildContext context, AsyncSnapshot<SessionState> snapshot) {
            if (!snapshot.hasData) {
              print("no snapshot");
              return Container();
            }

            SessionState _session = snapshot.data;
            print('MainLayout.build - $_session');
            shouldShowSignInScreen = _session.shouldShowSignInScreen();
            _checkLoginStateAfterBuild();

            if (shouldShowSignInScreen) return buildNotLoggedInView();

            return Scaffold(
              body: Container(
                child: Center(
                  child: Column(
                    children: [
                      Expanded(child: pages[currentPage].screenWidget),
                      buildBottomTab()
                    ],
                  ),
                ),
              ),
            );
        }
    );
  }
}