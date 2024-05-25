import 'package:cartoon_app/core/strings.dart';
import 'package:cartoon_app/data/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CharacterWebService {
  Dio? dio;

  CharacterWebService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      Response response = await dio!.get(charactersEndpoint);
      return List<Character>.from(
        response.data['results'].map(
              (e) => Character.fromJson(e),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
