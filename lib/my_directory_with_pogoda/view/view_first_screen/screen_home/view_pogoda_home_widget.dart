import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_first_screen/weather_avg_temperature_title.dart';
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_first_screen/weather_condition_text_title.dart';
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_first_screen/weather_location_name_title.dart';
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_first_screen/weather_max_and_min_temperature_ttle.dart';

import 'package:flutter/material.dart';

import '../../../../widget_weather/screens_home_widget.dart';

import '../background_image_house.dart';
import '../container_with_weekly_widget.dart';

class ViewPogoda extends StatefulWidget {
  const ViewPogoda({
    super.key,
  });

  @override
  State<ViewPogoda> createState() => _ViewPogodaState();
}

class _ViewPogodaState extends State<ViewPogoda> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                WeatherLocationNameTitle(),
                WeatherAvgTemperatureTitle(),
                WeatherConditionTextTitle(),
                WeatherMaxAndMinTemperatureTitle(),
              ],
            ),
          ),
          Positioned(
            top: 300,
            child: BackgroundImageHouse(),
          ),
          Positioned(
            bottom: 0,
            child: ContainerWithWeeklyWidget(),
          ),
        ],
      ),
    );
  }
}
