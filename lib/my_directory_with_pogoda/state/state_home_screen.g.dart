// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_home_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherState on WeatherStateBase, Store {
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??=
          Computed<int>(() => super.length, name: 'WeatherStateBase.length'))
      .value;

  late final _$currentCityAtom =
      Atom(name: 'WeatherStateBase.currentCity', context: context);

  @override
  JsonPogodaModel get currentCity {
    _$currentCityAtom.reportRead();
    return super.currentCity;
  }

  @override
  set currentCity(JsonPogodaModel value) {
    _$currentCityAtom.reportWrite(value, super.currentCity, () {
      super.currentCity = value;
    });
  }

  late final _$listNameCityAtom =
      Atom(name: 'WeatherStateBase.listNameCity', context: context);

  @override
  ObservableList<String> get listNameCity {
    _$listNameCityAtom.reportRead();
    return super.listNameCity;
  }

  @override
  set listNameCity(ObservableList<String> value) {
    _$listNameCityAtom.reportWrite(value, super.listNameCity, () {
      super.listNameCity = value;
    });
  }

  late final _$listCurrentCityAtom =
      Atom(name: 'WeatherStateBase.listCurrentCity', context: context);

  @override
  ObservableList<JsonPogodaModel> get listCurrentCity {
    _$listCurrentCityAtom.reportRead();
    return super.listCurrentCity;
  }

  @override
  set listCurrentCity(ObservableList<JsonPogodaModel> value) {
    _$listCurrentCityAtom.reportWrite(value, super.listCurrentCity, () {
      super.listCurrentCity = value;
    });
  }

  late final _$loadPogodaModelListAsyncAction =
      AsyncAction('WeatherStateBase.loadPogodaModelList', context: context);

  @override
  Future<void> loadPogodaModelList() {
    return _$loadPogodaModelListAsyncAction
        .run(() => super.loadPogodaModelList());
  }

  late final _$loadPogodaModelAsyncAction =
      AsyncAction('WeatherStateBase.loadPogodaModel', context: context);

  @override
  Future<void> loadPogodaModel({String? city}) {
    return _$loadPogodaModelAsyncAction
        .run(() => super.loadPogodaModel(city: city));
  }

  late final _$addCityToObservableListAsyncAction =
      AsyncAction('WeatherStateBase.addCityToObservableList', context: context);

  @override
  Future<void> addCityToObservableList(String city) {
    return _$addCityToObservableListAsyncAction
        .run(() => super.addCityToObservableList(city));
  }

  late final _$onCityTapAsyncAction =
      AsyncAction('WeatherStateBase.onCityTap', context: context);

  @override
  Future<void> onCityTap(String city, BuildContext context) {
    return _$onCityTapAsyncAction.run(() => super.onCityTap(city, context));
  }

  late final _$cityHomeAsyncAction =
      AsyncAction('WeatherStateBase.cityHome', context: context);

  @override
  Future<void> cityHome(String city, BuildContext context) {
    return _$cityHomeAsyncAction.run(() => super.cityHome(city, context));
  }

  @override
  String toString() {
    return '''
currentCity: ${currentCity},
listNameCity: ${listNameCity},
listCurrentCity: ${listCurrentCity},
length: ${length}
    ''';
  }
}
