import 'package:flutter/material.dart';
import 'package:shuqi_flutter/config/const.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';

class ShopMenu extends StatelessWidget {
  final List<MenuInfo> infos;
  ShopMenu(this.infos);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: infos.map((info) => menuItem(info)).toList(),
      ),
    );
  }

  Widget menuItem(MenuInfo info) {
    return Column(
      children: <Widget>[
        Image.asset(IMAGE_PATH+info.icon),
        SizedBox(height: 5),
        Text(info.title, style: TextStyle(fontSize: 12, color: SQColor.gray),)
      ],
    );
  }
}