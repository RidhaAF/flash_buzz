import 'package:dio/dio.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/env.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: defaultDuration,
      receiveTimeout: defaultDuration,
      sendTimeout: defaultDuration,
      queryParameters: {
        'country': Env.country,
        'apiKey': Env.apiKey,
      },
      receiveDataWhenStatusError: true,
    ),
  );
}
