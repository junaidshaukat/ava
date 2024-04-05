import '/core/app_export.dart';

class OpenaiApis extends Client {
  Future<dynamic> chatCompletions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> payload = const {},
    bool debugging = false,
  }) async {
    try {
      await isNetworkConnected();
      Response response = await dio.post(
        '{{openai}}/chat/completions',
        options: Options(headers: headers),
        queryParameters: payload,
        data: payload,
      );

      if (isSuccessCall(response, debugging: debugging)) {
        //return SendOtpRes.fromJson(response.data);
      } else {
        // throw response.data != null
        //     ? SendOtpRes.fromJson(response.data)
        //     : 'Something Went Wrong!';
      }
    } on NoInternetException {
      rethrow;
    } on DioException catch (e) {
      throw dioException(e);
    } catch (error, stackTrace) {
      console.log(error, stackTrace: stackTrace, name: 'catch');
      rethrow;
    }
  }
}
