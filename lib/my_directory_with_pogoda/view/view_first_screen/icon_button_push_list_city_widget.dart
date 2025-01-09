
import 'package:flutter/material.dart';

import '../view_list_container_with_city/view_list_city_weather.dart';

class IconButtonPushListCityWidget extends StatelessWidget {
  const IconButtonPushListCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ViewListCityWeather(),
          ),
        );
      },
      iconSize: 40,
      color: Colors.white70,
      icon: const Icon(Icons.format_list_bulleted_outlined),
    );
  }
}
