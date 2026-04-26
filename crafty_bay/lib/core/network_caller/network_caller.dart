import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();

  final Map<String, String> Function() headers;
  final VoidCallback onUnauthorize;

  NetworkCaller({required this.headers, required this.onUnauthorize});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      final Uri uri = Uri.parse(url);

      _logRequest(url);

      final Response response = await get(uri, headers: headers());

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        // Unauthorized
        onUnauthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Unauthorized',
        );
      } else {
        // Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['msg'],
          body: null,
        );
      }
    } on Exception catch (e) {
      // Failed
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
    bool fromLogin = false
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      final Response response = await post(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        // Unauthorized
        if (!fromLogin) {
          onUnauthorize();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Unauthorized',
        );
      } else {
        // Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['msg'],
        );
      }
    } on Exception catch (e) {
      // Failed
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      final Response response = await put(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        // Unauthorized
        onUnauthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Unauthorized',
        );
      } else {
        // Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['msg'],
        );
      }
    } on Exception catch (e) {
      // Failed
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      final Response response = await patch(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        // Unauthorized
        onUnauthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Unauthorized',
        );
      } else {
        // Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['msg'],
        );
      }
    } on Exception catch (e) {
      // Failed
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      final Response response = await delete(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        // Unauthorized
        onUnauthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Unauthorized',
        );
      } else {
        // Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['msg'],
        );
      }
    } on Exception catch (e) {
      // Failed
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i('URL => $url\nBODY => $body');
  }

  void _logResponse(Response response) {
    _logger.i('''URL => ${response.request!.url}
    STATUS CODE => ${response.statusCode}
    BODY => ${response.body}''');
  }
}
