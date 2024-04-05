import '/core/app_export.dart';

class ExceptionBody {
  /// A string field to hold a key associated with the exception
  String key;

  /// A string field to hold the message of the exception
  String message;

  /// A map field to hold additional data related to the exception
  Map<String, dynamic> body;

  /// Constructor with default values provided for fields
  ExceptionBody({
    /// Default value for the key field
    this.key = "unknown",

    /// Default value for the message field
    this.message = "unknown",

    /// Default value for the body field (an empty map)
    this.body = const {},
  });
}

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class CustomException implements Exception {
  String key;
  bool strict;
  String message;
  Map<String, dynamic> body;
  CustomException({
    this.key = "unknown",
    this.strict = false,
    this.message = "unknown",
    this.body = const {},
  });
}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class DioResponse implements Exception {
  final String? instanceId;
  final bool? result;
  final String? message;
  final dynamic messageDetails;
  final dynamic data;
  final dynamic errors;

  DioResponse({
    required this.instanceId,
    required this.result,
    required this.message,
    this.messageDetails,
    this.data,
    this.errors,
  });

  factory DioResponse.badCertificate(String message, {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.badResponse(Response? response,
      {String? message, bool debugging = false}) {
    String? instanceId;
    bool? result;
    dynamic data;
    dynamic errors;

    if (response?.statusCode == 401 &&
        response?.requestOptions.path != "/api/admin/v1/auth/login") {
      EnvConfig env = EnvConfig();
      env.clear().then((res) => Get.offAndToNamed(AppRoutes.splash));
    }

    if (response?.data != null) {
      instanceId = response?.data['instanceId'];

      result = response?.data['result'];

      if (response?.data['message'].toString().trim() != '') {
        message = response?.data['message'];
      }

      if (response?.data['messageDetails'] is String) {
        message = response?.data['messageDetails'];
      }

      if (response?.data['messageDetails'] is List) {
        List messageDetails = response?.data['messageDetails'];
        if (messageDetails.isNotEmpty) {
          message = messageDetails.map((item) => "• $item").join("\n");
        }
      }

      data = response?.data['data'];
      errors = response?.data['errors'];
    }

    if (debugging) console.log(response, name: 'badCertificate');

    return DioResponse(
      instanceId: instanceId,
      result: result,
      message: message,
      messageDetails: response?.data['messageDetails'],
      data: data,
      errors: errors,
    );
  }

  factory DioResponse.cancel(String message, {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.connectionError(String message,
      {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.connectionTimeout(String message,
      {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.receiveTimeout(String message, {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.sendTimeout(String message, {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.unknown(String message, {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.other(String message, {bool debugging = false}) {
    if (debugging) console.log(message, name: 'badCertificate');

    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }
}

class DioExceptions implements Exception {
  DioExceptions();

  build(DioException e, {bool debugging = false}) {
    if (e.type == DioExceptionType.badCertificate) {
      throw DioResponse.badCertificate(
        "The connection errored",
        debugging: debugging,
      );
    } else if (e.type == DioExceptionType.badResponse) {
      if (e.response != null) {
        throw DioResponse.badResponse(
          e.response,
          message: e.response?.statusMessage ?? e.message,
          debugging: debugging,
        );
      } else {
        throw DioResponse.badResponse(
          Response(
            data: {
              'instanceId': 'instanceId',
              'result': false,
              'message': 'Bad Response',
              'messageDetails': ['Bad Response'],
              'data': [],
            },
            requestOptions: RequestOptions(),
          ),
          debugging: debugging,
        );
      }
    } else if (e.type == DioExceptionType.cancel) {
      throw DioResponse.cancel(
        "request is cancelled",
        debugging: debugging,
      );
    } else if (e.type == DioExceptionType.connectionError) {
      throw DioResponse.connectionError(
        "connection error",
        debugging: debugging,
      );
    } else if (e.type == DioExceptionType.connectionTimeout) {
      throw DioResponse.connectionTimeout(
        "connection timeout",
        debugging: debugging,
      );
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw DioResponse.receiveTimeout(
        "receiving timeout",
        debugging: debugging,
      );
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw DioResponse.sendTimeout(
        "sent timeout",
        debugging: debugging,
      );
    } else if (e.type == DioExceptionType.unknown) {
      throw DioResponse.unknown(
        "unknown error",
        debugging: debugging,
      );
    } else {
      throw DioResponse.other(
        "other error",
        debugging: debugging,
      );
    }
  }
}
