import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../state/state_home_screen.dart';
class WeatherLocationNameTitle extends StatelessWidget {
  const WeatherLocationNameTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Text(
          context.read<WeatherState>().currentCity.location?.name.toString() ??
              'Ошибка',
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 34,
          ),
        );
      },
    );
  }
}
