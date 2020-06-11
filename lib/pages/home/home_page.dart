import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuqi_flutter/config/const.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';
import 'package:shuqi_flutter/pages/home/home_item.dart';
import 'package:shuqi_flutter/pages/home/novel.dart';
import 'package:shuqi_flutter/utils/mock_request.dart';
import 'package:shuqi_flutter/utils/screen.dart';
import 'package:shuqi_flutter/utils/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Novel> favoritedNovels = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;

  @override
  void initState() {
    super.initState();
    fetchData();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  Future<void> fetchData() async {
    try {
      List<Novel> tmpNovels = [];
      List<dynamic> favoriteResponse =
          await MockRequest.mock(action: 'bookshelf');
      favoriteResponse.forEach((data) {
        tmpNovels.add(Novel.fromJson(data));
      });

      setState(() {
        this.favoritedNovels = tmpNovels;
      });
    } catch (e) {
      ToastUtils.toast("err");
    }
  }

  Widget buildNavItems(Color iconColor) {
    return Row(
      children: <Widget>[
        Container(
          height: kToolbarHeight,
          width: 44,
          child: Image.asset(
            IMAGE_PATH + "actionbar_checkin.png",
            color: iconColor,
          ),
        ),
        Container(
          height: kToolbarHeight,
          width: 44,
          child: Image.asset(
            IMAGE_PATH + "actionbar_search.png",
            color: iconColor,
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }

  Widget buildNavBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            child: buildNavItems(SQColor.white),
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            color: SQColor.white,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 103,
                ),
                Expanded(
                  child: Text(
                    '书架',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildNavItems(SQColor.darkGray)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildFavoriteView() {
    if (favoritedNovels.length <= 1) {
      return Container();
    }
    List<Widget> children = [];
    var novels = favoritedNovels.sublist(1);
    novels.forEach((novel) {
      children.add(HomeItem(novel));
    });

    // var width = (Screen.width -15*2 -24*2) / 3;

    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 23,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SQColor.white,
      body: AnnotatedRegion(
        value: navAlpha > 0.5 ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
        child: Stack(children: <Widget>[
          RefreshIndicator(
            onRefresh: fetchData,
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              controller: scrollController,
              children: <Widget>[
                buildFavoriteView()
              ],
            ),
          
          )
        ],),
      ),
    );
  }
}
