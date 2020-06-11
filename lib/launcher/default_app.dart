import 'package:flutter/material.dart';
import 'package:shuqi_flutter/launcher/route/route_map.dart';
import 'package:shuqi_flutter/launcher/route/router.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';
import 'package:shuqi_flutter/pages/splash_dart.dart';
import 'package:shuqi_flutter/utils/sq_provider.dart';
import 'package:shuqi_flutter/utils/toast.dart';

class DefaultApp {
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(Store.init(MyApp()));
    initApp();
  }

  static void initApp() {
    // Router
    SQRouter.init();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ToastUtils.init(MaterialApp(
      title: "书旗",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: SQColor.paper,
        textTheme: TextTheme(bodyText1: TextStyle(color: SQColor.darkGray)),
      ),
      onGenerateRoute: SQRouter.router.generator,
      routes: RouteMap.routes,
      home: SplashPage(),
    ));
  }
}
