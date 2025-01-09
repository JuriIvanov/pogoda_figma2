import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../state/state_home_screen.dart';

class WeatherMaxAndMinTemperatureTitle extends StatelessWidget {
  const WeatherMaxAndMinTemperatureTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Text(
          'Maкс: ${context.read<WeatherState>().currentCity.forecast?.forecastday?[0].day?.maxtempC?.round().toString()}° Мин: ${context.watch<WeatherState>().currentCity.forecast?.forecastday?[0].day?.mintempC?.round().toString()}°',
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
          ),
        );
      },
    );
  }
}
