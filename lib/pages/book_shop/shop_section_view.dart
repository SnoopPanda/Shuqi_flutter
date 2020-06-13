import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuqi_flutter/config/const.dart';

class ShopSectionView extends StatelessWidget {
  final String title;
  ShopSectionView(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
      child: Row(
        children: <Widget>[
          Image.asset(IMAGE_PATH+'home_tip.png'),
          SizedBox(width: 10),
          Text(
            '$title',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}