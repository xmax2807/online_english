import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../settings.dart';

final dioProvider = Provider<Dio>((ctx) => Dio(BaseOptions(
      baseUrl: AppSetting.instance.dotEnv.get("API_ROOT", fallback: ""),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )));
