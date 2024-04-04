import 'package:http_interceptor/http_interceptor.dart';

class NetworkInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // Modify request headers, add additional headers, etc.
    final headers = data.headers;
    // Add any custom headers here if needed
    // headers['Custom-Header'] = 'Custom-Value';
    return data.copyWith(headers: headers);
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // Handle response, logging, error handling, etc.
    return data;
  }
}
