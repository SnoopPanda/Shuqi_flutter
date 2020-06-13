import 'package:flutter/widgets.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';
import 'package:shuqi_flutter/pages/home/novel.dart';
import 'package:shuqi_flutter/pages/home/novel_cover_view.dart';
import 'package:shuqi_flutter/utils/screen.dart';

class ShopNovelCoverView extends StatelessWidget {
  final Novel novel;
  ShopNovelCoverView(this.novel);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15*2-15*3)/4;
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCoverView(novel.imgUrl, width: width, height: width/0.75,),
            SizedBox(height: 5,),
            Text(
              novel.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            SizedBox(height: 3,),
            Text(
              novel.author,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: SQColor.gray),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}