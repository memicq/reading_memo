import 'package:flutter/material.dart';
import 'package:reading_memo/const/ColorConst.dart';
import 'package:reading_memo/models/TabPage.dart';
import 'package:reading_memo/widgets/book_list/book_list_page.dart';
import 'package:reading_memo/widgets/dashboard/dashboard_page.dart';
import 'package:reading_memo/widgets/setting/setting_page.dart';

class MainLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout>{
  int currentPage = 0;
  Map<int, TabPage> pages = {
    0: TabPage(
        title: "Dashboard",
        baseIcon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard_rounded,
        pageScaffold: DashboardPage()
    ),
    1: TabPage(
        title: "BookList",
        baseIcon: Icons.collections_bookmark_outlined,
        activeIcon: Icons.collections_bookmark_rounded,
        pageScaffold: BookListPage()
    ),
    2: TabPage(
        title: "Setting",
        baseIcon: Icons.settings_outlined,
        activeIcon: Icons.settings_rounded,
        pageScaffold: SettingPage()
    )
  };

  void movePage(int pageNumber) {
    setState(() {
      currentPage = pageNumber;
    });
  }

  Widget buildBottomTabItem(TabPage page, int pageNumber) {
    Icon icon = (pageNumber == this.currentPage)
        ? Icon(page.activeIcon, color: ColorConst.activeColor, size: 25)
        : Icon(page.baseIcon, color: ColorConst.disabledColor, size: 22);

    Text text = (pageNumber == this.currentPage)
        ? Text(page.title, style: TextStyle(color: FontColorConst.activeColor, fontSize: 11))
        : Text(page.title, style: TextStyle(color: FontColorConst.disabledColor, fontSize: 11));

    return Expanded(
        child: Container(
            child: TextButton(
              onPressed: (){ movePage(pageNumber); },
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

    return Container(
      padding: EdgeInsets.only(bottom: 30),
      height: 100,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: ColorConst.backgroundColor
      ),
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(child: pages[currentPage].pageScaffold),
              buildBottomTab()
            ],
          ),
        ),
      ),
    );
  }
}