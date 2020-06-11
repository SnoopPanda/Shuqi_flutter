import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shuqi_flutter/config/const.dart';

class MockRequest {
  static Future<dynamic> mock({String action, Map params}) async {
    var responseStr = await rootBundle.loadString(MOCK_PATH+'$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson['data'];
  }
}