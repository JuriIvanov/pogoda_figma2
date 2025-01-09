import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget_weather/screens_home_widget.dart';
import '../../state/state_home_screen.dart';
import 'icon_button_push_list_city_widget.dart';

class RowButtonWidget extends StatelessWidget {
  RowButtonWidget({super.key});

  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late String cityHome;
    final state = context.read<WeatherState>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const IconButtonPushGeolocation(),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Введите город"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          state.onCityTap(cityHome, context);
                        },
                        child: const Text("Добавить"),
                      ),
                    ],
                    content: TextField(
                      onChanged: (String value) {
                        cityHome = value;

                      },
                      onSubmitted: state.addCityToObservableList,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF2E335A),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white.withOpacity(0.6),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        hintText: 'Поиск города',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          iconSize: 40,
          color: Colors.white,
          icon: const Icon(Icons.add_circle_sharp),
        ),
        const IconButtonPushListCityWidget(),
        const IconButtonPushSettingsWeather(),
      ],
    );
  }
}
