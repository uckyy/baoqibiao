import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_endpoints.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> get(String path, {Map<String, String>? params}) async {
    final uri = Uri.parse("${ApiEndpoints.baseUrl}$path").replace(queryParameters: params);
    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw ApiException(response.statusCode, response.body);
    }
    return json.decode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse("${ApiEndpoints.baseUrl}$path");
    final response = await _client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: body != null ? json.encode(body) : null,
    );
    if (response.statusCode != 200) {
      throw ApiException(response.statusCode, response.body);
    }
    return json.decode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> postMultipart(String path, {
    required Map<String, String> fields,
    String? filePath,
  }) async {
    final uri = Uri.parse("${ApiEndpoints.baseUrl}$path");
    final request = http.MultipartRequest("POST", uri);
    request.fields.addAll(fields);
    if (filePath != null) {
      request.files.add(await http.MultipartFile.fromPath("screenshot", filePath));
    }
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode != 200) {
      throw ApiException(response.statusCode, response.body);
    }
    return json.decode(response.body) as Map<String, dynamic>;
  }

  void dispose() => _client.close();
}

class ApiException implements Exception {
  final int statusCode;
  final String body;
  const ApiException(this.statusCode, this.body);

  @override
  String toString() => "ApiException($statusCode): $body";
}
