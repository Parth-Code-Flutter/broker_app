class CloudFunctionResult {
  CloudFunctionResult({
    required this.success,
    this.data,
    this.eCode,
    this.eMsg,
  });
  bool success;
  dynamic data;
  String? eCode;
  String? eMsg;
}
