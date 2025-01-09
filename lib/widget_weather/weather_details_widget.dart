import 'package:flutter/material.dart';

import '../my_directory_with_pogoda/model/jsonPogodaModel.dart';
import '../my_directory_with_pogoda/repository/weather.dart';


class StateNotif extends ChangeNotifier {

  final repositoryArhitekture = RepositoryArhitekture();

  var pogoda = JsonPogodaModel();

  loadPogodaModel(String city) async {
    final result = await repositoryArhitekture.fetchPogoda(city);
    pogoda = result!;
  }

}