import 'package:flutter/cupertino.dart';

enum ShopListType {
  excellent,
  male,
  female,
  cartoon,
}

class ShopListView extends StatefulWidget {
  final ShopListType type;
  ShopListView(this.type);
  @override
  _ShopListViewState createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView> with AutomaticKeepAliveClientMixin{
  
  List carouseInfos = [];
  int pageIndex = 1;
  List modules = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => throw UnimplementedError();
  
}