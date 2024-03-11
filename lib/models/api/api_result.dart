class APIResult {
  APIResult({
    required this.success,
    this.message,
    this.data,
  });

  final bool success;
  final String? message;
  final dynamic data;

  @override
  String toString() =>
      'APIResult(success: $success, message: $message, data: $data)';
}
