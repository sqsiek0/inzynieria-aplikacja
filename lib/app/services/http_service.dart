import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> httpPost({
  required String url,
  required Map<String, dynamic> body,
  Map<String, String>? headers,
}) async {
  var headersFull = headers ??
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  final encodedBody = json.encode(body);

  final response = await http.post(
    Uri.parse(url),
    headers: headersFull,
    body: encodedBody,
  );

  return response;
}

Future<http.Response> httpPatch({
  required String url,
  required Map<String, dynamic> body,
  Map<String, String>? headers,
}) async {
  var headersFull = headers ??
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  final encodedBody = json.encode(body);

  final response =
      await http.patch(Uri.parse(url), headers: headersFull, body: encodedBody);
  return response;
}

Future<http.Response> httpGet({
  required String url,
  Map<String, String>? headers,
}) async {
  var headersFull = headers ??
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  final response = await http.get(Uri.parse(url), headers: headersFull);

  return response;
}

Future<http.Response> httpPut({
  required String url,
  required Map<String, dynamic> body,
  Map<String, String>? headers,
}) async {
  var headersFull = headers ??
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  final response = await http.put(
    Uri.parse(url),
    headers: headersFull,
    body: json.encode(body),
  );

  return response;
}

Future<http.Response> httpDelete({
  required String url,
  Map<String, String>? headers,
}) async {
  var headersFull = headers ??
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  final response = await http.delete(Uri.parse(url), headers: headersFull);

  return response;
}
