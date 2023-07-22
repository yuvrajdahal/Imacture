import 'package:dio/dio.dart';
import 'package:imacture/core/infrastructure/api_client.dart';
import 'package:riverpod/riverpod.dart';

final helloWorldProvider = Provider<Map<String, Object>>((ref) {
  return {"msg": 'Hello world', "count": 0};
});

final dioProvider = Provider<Dio>((ref) {
  return DioConfiguration().configureDio();
});
