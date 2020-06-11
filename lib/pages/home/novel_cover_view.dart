import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';

class NovelCoverView extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  
  NovelCoverView(this.imgUrl,{ this.width, this.height});
  
  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Image(
        image: CachedNetworkImageProvider(imgUrl),
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
      decoration: BoxDecoration(border: Border.all(color: SQColor.paper)),
    );
  }
  
}