import 'package:flutter/material.dart';
import 'package:shuqi_flutter/pages/book_shop/novel_cell.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_section_view.dart';
import 'package:shuqi_flutter/pages/home/novel.dart';

import 'novel_grid_item.dart';

class NovelFirstHybirdCard extends StatelessWidget {
  final ShopModule cardInfo;
  NovelFirstHybirdCard(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if(novels.length < 3) {
      return Container();
    }

    List<Widget> children = [];

    var bottomNovels = novels.sublist(1);
    bottomNovels.forEach((element) {
      children.add(NovelGridItem(element));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ShopSectionView(cardInfo.name),
          NovelCell(novels[0]),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 15, children: children,),
          ),
          Container(
            height: 10,
            color: Color(0xfff5f5f5),
          )
        ],
      ),
    );
  }
}