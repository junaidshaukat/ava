import 'dart:io';
import '/core/app_export.dart';

class Formdata {
  static FormData fromMap(Map<String, dynamic> requestData) {
    FormData data = FormData();

    requestData.forEach((key, value) async {
      if (value is File) {
        File file = value;
        data.files.add(MapEntry(
          key,
          await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
        ));
      } else {
        data.fields.add(MapEntry(key, value));
      }
    });

    return data;
  }
}
