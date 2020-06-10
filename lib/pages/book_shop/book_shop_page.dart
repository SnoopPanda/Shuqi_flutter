import 'package:flutter/material.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';

class BookShopPage extends StatefulWidget {
  @override
  _BookShopPageState createState() => _BookShopPageState();
}

class _BookShopPageState extends State<BookShopPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TabBar(
              labelColor: SQColor.darkGray,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: SQColor.gray,
              indicatorColor: SQColor.secondary,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: <Widget>[
                Tab(text: '精选'),
                Tab(text: '女生'),
                Tab(text: '男生'),
                Tab(text: '漫画'),
              ],
            ),
          ),
          backgroundColor: SQColor.white,
          elevation: 0,
        ),
        body: TabBarView(children: <Widget>[
          Center(child: Text('1'),),
          Center(child: Text('2'),),
          Center(child: Text('3'),),
          Center(child: Text('4'),),
        ],),
      ),
    );
  }
}
