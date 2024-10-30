

import 'package:dio/dio.dart';

import '../model/jsonPogodaModel.dart';

class Repository {
  final dio = Dio();
  Future<JsonPogodaModel?> fetchPogoda(String name) async {
    final response = await dio.get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/forecast.json?key=a41fe66795314b7bbb0173216241806&q=$name&days=3&aqi=no&alerts=no&lang=ru');
    print(response.statusCode);
    if (response.statusCode == 200 && response.data != null) {
      final result = JsonPogodaModel.fromJson(response.data!);
      return result;
    } else {
      return null;
    }
  }
}
