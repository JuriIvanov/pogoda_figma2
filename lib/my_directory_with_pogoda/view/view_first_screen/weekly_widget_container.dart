import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../state/state_home_screen.dart';

class WeeklyWidgetContainer extends StatelessWidget {
  const WeeklyWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: const Color(0xFF312D56).withOpacity(0.35),
                  border: Border.all(color: const Color(0xFF4F3275), width: 3)),
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Observer(
                      builder: (_) {
                        return Text(
                          '${context.read<WeatherState>().currentCity.forecast?.forecastday?[index].date}',
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        );
                      },
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      if (context
                          .read<WeatherState>()
                          .currentCity
                          .forecast
                          ?.forecastday?[index]
                          .day
                          ?.condition
                          ?.icon ==
                          null) {
                        return const Image(
                          image: AssetImage(
                            'assets/image/Пасмурно.png',
                          ),
                        );
                      } else {
                        return Image.network(
                          "https:${context.read<WeatherState>().currentCity.forecast?.forecastday?[index].day?.condition?.icon}",
                        );
                      }
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        '${context.read<WeatherState>().currentCity.forecast?.forecastday?[index].day?.avgtempC?.round().toString()}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
