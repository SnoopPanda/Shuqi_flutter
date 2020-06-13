import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuqi_flutter/pages/book_shop/first_hybird_view.dart';
import 'package:shuqi_flutter/pages/book_shop/four_grid_view.dart';
import 'package:shuqi_flutter/pages/book_shop/novel_normal_card.dart';
import 'package:shuqi_flutter/pages/book_shop/second_hybird_view.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_banner.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_menu.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';
import 'package:shuqi_flutter/utils/mock_request.dart';
import 'package:shuqi_flutter/utils/toast.dart';

enum ShopListType {
  excellent,
  male,
  female,
  cartoon,
}

class ShopListView extends StatefulWidget {
  final ShopListType type;
  ShopListView(this.type);
  @override
  _ShopListViewState createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView>
    with AutomaticKeepAliveClientMixin {
  List<CarouselInfo> carouseInfos = [];
  int pageIndex = 1;
  List<ShopModule> modules = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var action;
      switch (this.widget.type) {
        case ShopListType.excellent:
          action = 'home_excellent';
          break;
        case ShopListType.female:
          action = 'home_female';
          break;
        case ShopListType.male:
          action = 'home_male';
          break;
        case ShopListType.cartoon:
          action = 'home_cartoon';
          break;
        default:
          break;
      }

      var responseJson = await MockRequest.mock(action: action);
      List moduleData = responseJson['module'];
      List<ShopModule> modules = [];
      moduleData.forEach((data) {
        modules.add(ShopModule.fromJson(data));
      });

      setState(() {
        this.modules = modules;
        this.carouseInfos = carouseInfos;
      });
    } catch (e) {
      ToastUtils.toast(e.toString());
    }
  }

  Widget bookCardWithInfo(ShopModule module) {
    Widget card;
    switch (module.style) {
      case 1: 
        card = NovelFourGridView(module);
        break;
            case 2:
        card = NovelSecondHybirdCard(module);
        break;
      case 3:
        card = NovelFirstHybirdCard(module);
        break;
      case 4:
        card = NovelNormalCard(module);
        break;
    }
    return card;
  }

  Widget buildModule(BuildContext context, ShopModule module) {
    if(module.carousels != null) {
      return ShopBanner(module.carousels);
    }else if(module.menus != null) {
      return ShopMenu(module.menus);
    }else if(module.books != null) {
      return bookCardWithInfo(module);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (BuildContext context, int index) {
            return buildModule(context, modules[index]);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
