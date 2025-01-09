import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_list_container_with_city/wideget_for_list_city/container_for_city_weather_data.dart';
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_list_container_with_city/wideget_for_list_city/my_app_bar.dart';
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_list_container_with_city/wideget_for_list_city/text_field_fiew_list_city.dart';
import 'package:flutter/material.dart';

class ViewListCityWeather extends StatelessWidget {
  const ViewListCityWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1F1D47),
      appBar: MyAppBar(),
      body: Column(
        children: [
          TextFieldViewListCity(),
          Expanded(child: ContainerForCityWeatherData()),
        ],
      ),
    );
  }
}

//скелетон
