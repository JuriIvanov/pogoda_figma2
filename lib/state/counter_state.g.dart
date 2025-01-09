// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterState on _CounterState, Store {
  late final _$observableListAtom =
      Atom(name: '_CounterState.observableList', context: context);

  @override
  ObservableList<String> get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<String> value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$_CounterStateActionController =
      ActionController(name: '_CounterState', context: context);

  @override
  void onCityTap(int index, BuildContext context) {
    final _$actionInfo = _$_CounterStateActionController.startAction(
        name: '_CounterState.onCityTap');
    try {
      return super.onCityTap(index, context);
    } finally {
      _$_CounterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addCityToObservableList(String city) {
    final _$actionInfo = _$_CounterStateActionController.startAction(
        name: '_CounterState.addCityToObservableList');
    try {
      return super.addCityToObservableList(city);
    } finally {
      _$_CounterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList}
    ''';
  }
}
