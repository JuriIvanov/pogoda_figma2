import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'my_custom_clipper.dart';
import '../../../state/state_home_screen.dart';

class ContainerForCityWeatherData extends StatelessWidget {
  const ContainerForCityWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<WeatherState>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Observer(
          builder: (_) => Column(
            children: state.listCurrentCity
                .map(
                  (jsonPogodaModel) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      onDismissed: (DismissDirection direction) {},
                      key: UniqueKey(),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            state.onCityTap(jsonPogodaModel.location!.name.toString(), context);
                            Navigator.of(context).pop();
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: MyCustomClipper(),
                                child: Container(
                                  height: 184,
                                  width: 360,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF5936B4),
                                      Color(0xFF362A84),
                                    ]),
                                    // borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 28),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${jsonPogodaModel.forecast?.forecastday?[0].day?.avgtempC?.round().toString()}°',
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 72,
                                                  height: 0.85,
                                                  fontWeight:
                                                      FontWeight.w300),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              'Maкс: ${jsonPogodaModel.forecast?.forecastday?[0].day?.maxtempC?.round().toString()}° Мин: ${state.currentCity.forecast?.forecastday?[0].day?.mintempC?.round().toString()}°',
                                              style: TextStyle(
                                                color: const Color(0xFFFFFFFF)
                                                    .withOpacity(0.6),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              jsonPogodaModel.location?.name
                                                      .toString() ??
                                                  'Ошибка',
                                              style: const TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        right: 20,
                                        child: Text(
                                          jsonPogodaModel
                                                  .current?.condition?.text
                                                  .toString() ??
                                              '__',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Positioned(
                                right: 0,
                                top: 0,
                                height: 150,
                                width: 150,
                                child: Image(
                                  image: AssetImage(
                                    'assets/image/Пасмурно.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
