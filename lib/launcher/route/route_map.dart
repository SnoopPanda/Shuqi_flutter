import 'package:flutter/material.dart';
import 'package:shuqi_flutter/pages/book_shop/book_shop_page.dart';
import 'package:shuqi_flutter/pages/home/home_page.dart';
import 'package:shuqi_flutter/pages/me/me_page.dart';
import 'package:shuqi_flutter/pages/root_page.dart';


class RouteMap {

  static final rootPage = '/root';
  static final homePage = '/home';
  // static final loginPage = '/login';
  // static final registerPage = '/register';
  static final bookShopPage = '/bookShopPage';
  static final mePage = '/mePage';

  static final routes = <String, WidgetBuilder>{
    rootPage: (BuildContext context) => RootPage(),
    homePage: (BuildContext context) => HomePage(),
    // loginPage: (BuildContext context) => LoginPage(),
    // registerPage: (BuildContext context) => RegisterPage(),
    bookShopPage: (BuildContext context) => BookShopPage(),
    mePage: (BuildContext context) => MePage(),
  };
}
