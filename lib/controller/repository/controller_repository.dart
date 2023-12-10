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

  Future<void> rotateBody(
    String axis,
    String value,
  ) async {
    final body = <String, dynamic>{};
    body['axis'] = axis;
    body['value'] = value;

    final respnse = await httpPost(
      url: '${Strings.apiName}/rotate',
      body: body,
    );
    print(respnse.statusCode);
  }

  Future<void> walk(
    String walkState,
  ) async {
    final body = <String, dynamic>{};
    body['walkState'] = walkState;

    final respnse = await httpPost(
      url: '${Strings.apiName}/walking',
      body: body,
    );
    print(respnse.statusCode);
  }

  Future<void> turning(
    String turnState,
  ) async {
    final body = <String, dynamic>{};
    body['turn'] = turnState;

    final respnse = await httpPost(
      url: '${Strings.apiName}/turning',
      body: body,
    );
    print(respnse.statusCode);
  }
}
