import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:helper_task/ui/model/category_deteils_model.dart';
import '../../../utils/base_url.dart';
import '../../../utils/base_util.dart';
import '../api_client.dart';

class DioApiClient extends ApiClient {
  static late DioApiClient _service;

  static Dio? _dio;

  static Dio get _dioClient => _dio!;

  DioApiClient._();

  static Future<DioApiClient> getInstance() async {
    if (_dio == null) {
      _dio = _init();
      _service = DioApiClient._();
    }
    return _service;
  }

  static Dio _init() {
    final dio = Dio();
    dio.options.baseUrl = BaseUrl.baseUrl;

    dio.options.connectTimeout = TimeOut.connectTimeout.inMilliseconds;
    dio.options.receiveTimeout = TimeOut.connectTimeout.inMilliseconds;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              d.fields.forEach(((field) =>
                  debugPrint('Fields: ${field.key}: ${field.value}')));
              d.files.forEach(((field) => debugPrint(
                  'Files: ${field.key}: ${field.value.filename} (${field.value.contentType?.mimeType})')));
            }
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
    ));
    return dio;
  }

  @override
  Future<CategoryDetailsModel> getCategory() async {
    final response = await _dioClient.get(UrlPath.fetchData);
    return CategoryDetailsModel.fromJson(response.data);
  }
}
