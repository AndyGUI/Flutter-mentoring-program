import 'package:dio/dio.dart';
import 'package:flutter_mentoring_programm/dio/client/retrofit_style_client.dart';

class ApiClient {
  // Let it be just a singleton
  static final ApiClient _singleton = ApiClient._internal();
  final _dio = Dio();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal() {
    // config your dio headers globally
    _dio.options
      ..headers["Demo-Header"] = "demo header"
      ..headers["Content-Type"] = "application/json"
      ..maxRedirects = 5
      ..followRedirects = true
      ..connectTimeout = 3000
      ..receiveTimeout = 5000
      ..sendTimeout = 10000;

    final fakeDataInjector = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return _dio.resolve("fake data");
      },
    );
    final headerInjector = InterceptorsWrapper(
      onRequest: (Options options) async {
        _dio.interceptors.requestLock.lock();
        options.headers["token"] = "Bearer: ASD&ASD";
        _dio.interceptors.requestLock.unlock();
        return options;
      },
    );
    _dio.interceptors.addAll(
      [
        headerInjector,
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
//        CustomInterceptors(),
        // mocker
//        fakeDataInjector,
      ],
    );
  }

  RestClient provideRestClient() => RestClient(_dio);
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("RESPONSE[${response?.statusCode}] => "
        "PATH: ${response?.request?.path}");
    print("BODY =>  ${response?.data}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}
