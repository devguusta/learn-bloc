import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = "https://jsonplaceholder.typicode.com";
    options.contentTypeWithRequestBody("application/json");
    interceptors.addAll([
      // TokenInterceptors(),
    ]);
  }
}
