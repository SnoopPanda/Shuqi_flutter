import 'package:flutter/material.dart';
import 'package:shuqi_flutter/pages/home/novel.dart';
import 'package:shuqi_flutter/pages/home/novel_cover_view.dart';
import 'package:shuqi_flutter/utils/screen.dart';

class HomeItem extends StatelessWidget {
  final Novel novel;
  HomeItem(this.novel);
  
  @override
  Widget build(BuildContext context) {
    var width = (Screen.width-15*2-24*2)/3;
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width:width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: NovelCoverView(
                this.novel.imgUrl,
                width: width,
                height: width/0.75,
              ),
              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x22000000), blurRadius: 5)]),
            ),
            SizedBox(height: 10,),
            Text(novel.name, style: TextStyle(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis,),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}