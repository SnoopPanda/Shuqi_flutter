import 'package:flutter/material.dart';
import 'package:shuqi_flutter/pages/book_shop/novel_grid_item.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_cover_view.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_section_view.dart';

class NovelSecondHybirdCard extends StatelessWidget {
  final ShopModule cardInfo;

  NovelSecondHybirdCard(this.cardInfo);
  
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if(novels.length < 5) {
      return Container();
    }

    var topNovels = novels.sublist(0, 4);
    List<Widget> children = [];

    
    topNovels.forEach((element) {
      children.add(ShopNovelCoverView(element));
    });

    var bottomNovels = novels.sublist(4);

    bottomNovels.forEach((element) {
      children.add(NovelGridItem(element));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ShopSectionView(cardInfo.name),
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