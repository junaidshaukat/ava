import '/core/app_export.dart';

class Client {
  final String _baseUrl = EnvConfig().hostname;
  final Dio dio = Dio();

  Client() {
    dio.options.baseUrl = _baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        Map<String, String> headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
        };

        if (options.path.contains('{{openai}}')) {
          options.baseUrl = 'https://api.openai.com/v1';
          options.path = options.path.replaceAll('{{openai}}', '');

          if (EnvConfig().openai != null) {
            headers.addAll({'Authorization': "Bearer ${EnvConfig().openai}"});
          }
        }

        options.headers.addAll(headers);

        console.log(
          {
            'path': options.path,
            'uri': options.uri,
            'data': options.data,
            'headers': options.headers,
          },
          name: 'onRequest',
        );

        return handler.next(options);
      },
    ));
  }

  bool isSuccessCall(Response response, {bool debugging = false}) {
    if (debugging) console.log(response, name: 'Response');
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }

  Future<void> isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  dioException(DioException response, {bool debugging = false}) {
    throw DioExceptions().build(response, debugging: debugging);
  }
}
