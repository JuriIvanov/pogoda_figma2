import 'package:figma_pogoda2/my_directory_with_pogoda/repository/weather.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../model/jsonPogodaModel.dart';

part 'state_home_screen.g.dart';

class WeatherState = WeatherStateBase with _$WeatherState;

abstract class WeatherStateBase with Store {
  final repositoryArhitekture = RepositoryArhitekture();

  @observable
  var currentCity = JsonPogodaModel();

  @observable
  ObservableList<String> listNameCity =
      ObservableList<String>.of(['Москва', 'Дербент']);

  @observable
  ObservableList<JsonPogodaModel> listCurrentCity =
      ObservableList<JsonPogodaModel>();

  @computed
  int get length => listNameCity.length;

  @action
  Future<void> loadPogodaModelList() async {
    for (int i = 0; i <= listNameCity.length; i++) {
      final listResultCurrentCity =
          await repositoryArhitekture.fetchPogoda(listNameCity[i]);
      listCurrentCity.add(listResultCurrentCity!);
    }
  }

  @action
  Future<void> loadPogodaModel({String? city}) async {
    final result =
        await repositoryArhitekture.fetchPogoda(city ?? listNameCity.first);
    if (result != null) {
      currentCity = result;
    }
  }

  @action
  Future<void> addCityToObservableList(String city) async {
    listNameCity.add(city);
    final listResultCurrentCity = await repositoryArhitekture.fetchPogoda(city);
    listCurrentCity.add(listResultCurrentCity!);
  }

  @action
  Future<void> onCityTap(String city, BuildContext context) async {
    await loadPogodaModel(city: city);
  }

  @action
  Future<void> cityHome(String city, BuildContext context) async {
    await loadPogodaModel(city: city);
  }
}
