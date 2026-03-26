part of 'network_caller.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? body;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.body,
    this.errorMessage = 'Something went wrong',
  });
}
