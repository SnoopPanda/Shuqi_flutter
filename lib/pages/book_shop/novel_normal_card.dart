import 'package:flutter/material.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_section_view.dart';

import 'novel_cell.dart';

class NovelNormalCard extends StatelessWidget {
  final ShopModule cardInfo;

  NovelNormalCard(this.cardInfo);
  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if(novels.length < 3) {
      return null;
    }

    List<Widget> children = [
      ShopSectionView(cardInfo.name),
    ];
    
    for(var i=0;i<novels.length;i++) {
      var novel = novels[i];
      children.add(NovelCell(novel));
      children.add(Divider(height:1));
    }

    children.add(Container(height:10, color: Color(0xfff5f5f5)));

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}