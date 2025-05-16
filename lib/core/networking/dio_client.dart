import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      headers: {'Content-Type': 'application/json'},
    ));

    // Add logging interceptor (optional)
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
    ));
  }

  Dio get instance => dio;
}
