import 'package:robot_controller/app/services/http_service.dart';
import 'package:robot_controller/app/src/constants/strings.dart';

class ControllerRepository {
  Future<void> translateBody(
    String axis,
    String value,
  ) async {
    final body = <String, dynamic>{};
    body['axis'] = axis;
    body['value'] = value;

    final respnse = await httpPost(
      url: '${Strings.apiName}/translation',
      body: body,
    );
    print(respnse.statusCode);
  }
}
