import 'package:flutter/material.dart';
import 'package:shuqi_flutter/launcher/route/route_map.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: FlutterLogo(size: 96,),
      ),
    );
  }

  void countDown() {
    var _duration = Duration(seconds: 2);
    new Future.delayed(_duration, goHomePage);
  }

  void goHomePage() {
    Navigator.of(context).pushReplacementNamed(RouteMap.rootPage);
  }
}