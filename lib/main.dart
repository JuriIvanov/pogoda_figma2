import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_directory_with_pogoda/view/view_first_screen/screen_home/view_pogoda_home_widget.dart';
import 'my_directory_with_pogoda/state/state_home_screen.dart';

late final SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final WeatherState _weatherState = WeatherState();

  @override
  Widget build(BuildContext context) {
    _weatherState.initialization();
    return MultiProvider(
      providers: [
        Provider<WeatherState>(create: (_) => _weatherState),
      ],
      child: const MaterialApp(
        home: ViewPogoda(),
      ),
    );
  }
}
