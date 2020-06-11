import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shuqi_flutter/launcher/sq_color.dart';

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: SQColor.white,
        padding: EdgeInsets.fromLTRB(20, 30, 25, 15),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "枸杞子",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildItems(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildInfoItem("100", "书豆余额"),
        buildInfoItem("100", "书券（张）"),
        buildInfoItem("10", "月票"),
      ],
    );
  }

  Widget buildInfoItem(String value, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: SQColor.gray),
        ),
      ],
    );
  }
}
