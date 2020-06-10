import 'package:flutter/cupertino.dart';
import 'package:shuqi_flutter/config/const.dart';
import 'package:shuqi_flutter/pages/me/me_menu_cell.dart';

class MeMenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MeCell(
          title: "钱包",
          iconName: IMAGE_PATH + "me_wallet.png",
          onPressed: () {},
        ),
        MeCell(
          title: "消费充值记录",
          iconName: IMAGE_PATH + "me_record.png",
          onPressed: () {},
        ),
        MeCell(
          title: "购买的书",
          iconName: IMAGE_PATH + "me_buy.png",
          onPressed: () {},
        ),
        MeCell(
          title: "我的会员",
          iconName: IMAGE_PATH + "me_vip.png",
          onPressed: () {},
        ),
                MeCell(
          title: "个性换肤",
          iconName: IMAGE_PATH + "me_theme.png",
          onPressed: () {},
        ),
                MeCell(
          title: "设置",
          iconName: IMAGE_PATH + "me_setting.png",
          onPressed: () {},
        ),
                MeCell(
          title: "我的会员",
          iconName: IMAGE_PATH + "me_vip.png",
          onPressed: () {},
        ),

      ],
    );
  }
}
