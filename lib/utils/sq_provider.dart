import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shuqi_flutter/config/const.dart';

class Store {
  // 内部构造方法，可避免外部暴露构造函数进行实例化
  Store._internal();

  static init(Widget child) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => AppTheme(getDefaultTheme()),),
        // ChangeNotifierProvider.value(value: LocaleModel(SPUtils.getLocale()),),
        // ChangeNotifierProvider.value(value: UserProfile(SPUtils.getNickName()),),
        ChangeNotifierProvider.value(value: AppStatus(TAB_HOME_INDEX),)
      ],
      child: child,
    );
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T value<T>(BuildContext context, {bool listen = false}) {
    return Provider.of<T>(context, listen: listen);
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T of<T>(BuildContext context, {bool listen = true}) {
    return Provider.of<T>(context, listen: listen);
  }

  // 不会引起页面的刷新，只刷新了 Consumer 的部分，极大地缩小你的控件刷新范围
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}

class AppStatus with ChangeNotifier {
  // 主页tab的索引
  int _tabIndex;
  AppStatus(this._tabIndex);
  int get tabIndex => _tabIndex;
  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}