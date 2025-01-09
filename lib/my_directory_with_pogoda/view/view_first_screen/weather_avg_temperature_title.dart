import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../state/state_home_screen.dart';

class WeatherAvgTemperatureTitle extends StatelessWidget {
  const WeatherAvgTemperatureTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Text(
          context
              .read<WeatherState>()
              .currentCity
              .forecast
              ?.forecastday?[0]
              .day
              ?.avgtempC
              ?.round()
              .toString() ??
              '_',
          style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 96,
              height: 0.85,
              fontWeight: FontWeight.w200),
        );
      },
    );
  }
}
