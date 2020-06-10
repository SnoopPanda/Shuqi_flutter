import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuqi_flutter/pages/me/me_menu_view.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              MeMenuView(),
            ],
          ),
        ),
      ),
    );
  }
}