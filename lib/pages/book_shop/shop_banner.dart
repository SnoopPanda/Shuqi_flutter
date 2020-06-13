import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuqi_flutter/pages/book_shop/shop_module.dart';
import 'package:shuqi_flutter/utils/screen.dart';

class ShopBanner extends StatelessWidget {
  final List<CarouselInfo> carouseInfos;
  
  ShopBanner(this.carouseInfos);

  Widget build(BuildContext context) {
    if(carouseInfos.length == 0) {
      return SizedBox();
    }

    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: carouseInfos.map((info) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: Screen.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  info.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 2,
          autoPlay: true
        ),
      ),
    );

  }
}