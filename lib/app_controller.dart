import 'package:dio/dio.dart';

import 'core/services/dio/custom_dio.dart';

class AppController {
  final Dio dio = CustomDio();
}
