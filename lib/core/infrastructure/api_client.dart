import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:imacture/core/shared/constants.dart';

class DioConfiguration {
  Dio configureDio() {
    final dio = Dio();

    dio.options.baseUrl = url;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Client-ID ${dotenv.env["UNSPLASH_API"]}'
    };

    return dio;
  }
}
