import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuqi_flutter/config/const.dart';
import 'package:shuqi_flutter/pages/book_shop/book_shop_page.dart';
import 'package:shuqi_flutter/pages/home/home_page.dart';
import 'package:shuqi_flutter/pages/me/me_page.dart';
import 'package:shuqi_flutter/utils/click.dart';
import 'package:shuqi_flutter/utils/sq_provider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Image> _tabImages = [
    Image.asset(IMAGE_PATH + "tab_bookshelf_n.png"),
    Image.asset(IMAGE_PATH + "tab_bookshelf_n.png"),
    Image.asset(IMAGE_PATH + "tab_bookshelf_n.png"),
  ];

  List<Image> _tabSelectedImages = [
    Image.asset(IMAGE_PATH + 'tab_bookshelf_p.png'),
    Image.asset(IMAGE_PATH + 'tab_bookstore_p.png'),
    Image.asset(IMAGE_PATH + 'tab_me_p.png'),
  ];

  List<BottomNavigationBarItem> getTabs(
          BuildContext context, AppStatus status) =>
      [
        BottomNavigationBarItem(
            title: Text("书架"), icon: getTabIcon(TAB_HOME_INDEX, status)),
        BottomNavigationBarItem(
            title: Text("书城"), icon: getTabIcon(TAB_BOOKSHOP_INDEX, status)),
        BottomNavigationBarItem(
            title: Text("我的"), icon: getTabIcon(TAB_ME_INDEX, status)),
      ];

  Image getTabIcon(int index, AppStatus status) {
    if (index == status.tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }

    List<Widget> getTabWidget(BuildContext context)  => [
    Center(child: Text("书架")),
    Center(child: Text("书城")),
    Center(child: Text("我的")),
  ];

  // List<Widget> getTabPage(BuildContext context) =>
  //     [HomePage(), BookShopPage(), MePage()];
  // 如果我们要想在外部该变改控件的状态，我们就需要使用GlobalKey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, AppStatus status, Widget child) {
        var tabs = getTabs(context, status);
        return WillPopScope(
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: tabs[status.tabIndex].title,
            ),
            body: IndexedStack(
              index: status.tabIndex,
              children: getTabWidget(context),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: tabs,
              currentIndex: status.tabIndex,
              onTap: (index) {
                status.tabIndex = index;
              },
            ),
          ),
          onWillPop: () =>
              ClickUtils.exitBy2Click(status: _scaffoldKey.currentState),
        );
      },
    );
  }
}
