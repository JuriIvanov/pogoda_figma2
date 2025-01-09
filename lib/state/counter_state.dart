import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


import '../widget_weather/screens_home_widget.dart';

part 'counter_state.g.dart';

class CounterState = _CounterState with _$CounterState;

abstract class _CounterState with Store {
  @observable
  ObservableList<String> observableList = ObservableList();

  @action
  void onCityTap(int index, BuildContext context) {
    final id = observableList[index];
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return ScreensHomeWidget(city: id);
      }),
    );
  }
  // @observable
  // TextField textField = TextField();

  @action
  addCityToObservableList (String city){
    if(city.isNotEmpty){
      observableList.add(city);
      print(observableList.toString());
    }

  }



}
