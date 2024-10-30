import 'package:figma_pogoda2/widget_weather/list_city.dart';
import 'package:flutter/material.dart';

import 'widget_weather/fagma_pogoda2.dart';
import 'widget_weather/screens_home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(


        home: ListCityWidget());
  }
}
