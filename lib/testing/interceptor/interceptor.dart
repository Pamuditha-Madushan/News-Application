// ignore_for_file: avoid_print

import 'package:http_interceptor/http_interceptor.dart';

class InsituteApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.params['token'] = "sjodhlashdhalsasdjasldhasldhals";
      data.params['units'] = 'metric';
      data.headers["Content-Type"] = "application/json";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
