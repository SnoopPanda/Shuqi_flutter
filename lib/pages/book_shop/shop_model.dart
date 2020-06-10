class ShopModel {
  String id;
  String name;
  int style;
  List content;
  
  List<CarouselInfo> carousels;
  List<MenuInfo> menus;
}

class MenuInfo {
  String title;
  String icon;
  
  MenuInfo.fromJson(Map data) {
    title = data['toTitle'];
    icon = data['icon'];
  }
}

class CarouselInfo {
  String imageUrl;
  String link;
  
  CarouselInfo.fromJson(Map data) {
    imageUrl = data['image_url'];
    link = data['link_url'];
  }
}