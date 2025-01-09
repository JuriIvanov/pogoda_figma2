

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../state/state_home_screen.dart';

class WeatherConditionTextTitle extends StatelessWidget {
  const WeatherConditionTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Text(
          context
              .read<WeatherState>()
              .currentCity
              .current
              ?.condition
              ?.text
              .toString() ??
              '__',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: const Color(0xFFFFFFFF).withOpacity(0.6),
              fontSize: 24,
              height: 0.95),
        );
      },
    );
  }
}