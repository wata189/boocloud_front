import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtil {
  static const String _baseUrl = 'https://api.example.com';
  
  static final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = _buildUri(endpoint, queryParams);
    final mergedHeaders = {..._defaultHeaders, ...?headers};
    
    try {
      final response = await http
          .get(uri, headers: mergedHeaders);
      
      return _handleResponse(response);
    } catch (e) {
      throw HttpException('GET request failed: $e');
    }
  }

  static Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(endpoint);
    final mergedHeaders = {..._defaultHeaders, ...?headers};
    
    try {
      final response = await http
          .post(
            uri,
            headers: mergedHeaders,
            body: body != null ? json.encode(body) : null,
          );
      
      return _handleResponse(response);
    } catch (e) {
      throw HttpException('POST request failed: $e');
    }
  }

  static Uri _buildUri(String endpoint, [Map<String, dynamic>? queryParams]) {
    final uri = Uri.parse('$_baseUrl$endpoint');
    if (queryParams != null && queryParams.isNotEmpty) {
      return uri.replace(queryParameters: queryParams.map(
        (key, value) => MapEntry(key, value.toString()),
      ));
    }
    return uri;
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {'success': true};
      }
      try {
        return json.decode(response.body) as Map<String, dynamic>;
      } catch (e) {
        throw HttpException('Failed to parse response JSON: $e');
      }
    } else {
      throw HttpException(
        'HTTP ${response.statusCode}: ${response.reasonPhrase}',
        statusCode: response.statusCode,
      );
    }
  }
}

class HttpException implements Exception {
  final String message;
  final int? statusCode;

  HttpException(this.message, {this.statusCode});

  @override
  String toString() => 'HttpException: $message';
}