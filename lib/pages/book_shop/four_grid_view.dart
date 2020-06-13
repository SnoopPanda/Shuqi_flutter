import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuqi_flutter/config/const.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_cover_view.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_section_view.dart';

class NovelFourGridView extends StatelessWidget {
  final ShopModule cardInfo;
  
  NovelFourGridView(this.cardInfo);

  
  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if(novels.length < 8) {
      return Container();
    }
    
    var children = novels.map((novel)=> ShopNovelCoverView(novel)).toList();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ShopSectionView(cardInfo.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 20, children: children,),
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