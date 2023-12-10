import 'dart:convert';

import 'package:robot_controller/app/services/http_service.dart';
import 'package:robot_controller/app/src/constants/strings.dart';

class HomeRepository {
  Future<bool> isRobotWorking() async {
    final rawResponse = await httpGet(url: "${Strings.apiName}/working");
    if (rawResponse.statusCode == 200) {
      final body = jsonDecode(rawResponse.body);
      return body['isWorking'];
    } else {
      throw Exception('Failed to load album');
    }
  }
}
