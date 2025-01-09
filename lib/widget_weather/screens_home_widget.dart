import 'package:figma_pogoda2/my_directory_with_pogoda/model/jsonPogodaModel.dart';
import 'package:flutter/material.dart';

import '../my_widget/settings_weather.dart';
import 'geolocation.dart';
import '../my_widget/week_widget.dart';
import '../repository/repository.dart';
import 'list_city.dart';

class ScreensHomeWidget extends StatefulWidget {
  String city;

  ScreensHomeWidget({
    super.key,
    required this.city,
  });

  @override
  State<ScreensHomeWidget> createState() => _ScreensHomeWidgetState();
}

class _ScreensHomeWidgetState extends State<ScreensHomeWidget> {
  final jsonPogodaModel = JsonPogodaModel();

  final repository = Repository();


  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(),
            Center(
              child: FutureBuilder<JsonPogodaModel?>(
                future: repository.fetchPogoda(widget.city),
                builder: (BuildContext context,
                    AsyncSnapshot<JsonPogodaModel?> snapshot) {
                  if (snapshot.hasData) {
                    final String? conditionText =
                        snapshot.data?.current?.condition?.text;
                    final String? location =
                        snapshot.data?.location?.name.toString();
                    final int? tempC = snapshot
                        .data?.forecast!.forecastday?[0].day?.avgtempC
                        ?.round();
                    final String strTempC = '$tempC°';
                    int? maxtempC = snapshot
                        .data?.forecast!.forecastday![0].day!.maxtempC
                        ?.round();
                    int? mintempC = snapshot
                        .data?.forecast!.forecastday![0].day!.mintempC
                        ?.round();
                    String tempString = "Макс: $maxtempC°  Мин: $mintempC°";

                    return Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          location!,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 34,
                          ),
                        ),
                        Text(
                          strTempC,
                          style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 96,
                              height: 0.85,
                              fontWeight: FontWeight.w200),
                        ),
                        Text(
                          maxLines: 2,
                          conditionText!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF).withOpacity(0.6),
                              fontSize: 24,
                              height: 0.95),
                        ),
                        Text(
                          tempString,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('Пока нет данных');
                  }
                },
              ),
            ),
            const Positioned(
              top: 300,
              child: ImageHouse(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 290,
                width: 392.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    transform: GradientRotation(25),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF682F8C),
                      Color(0xFF3B2F65),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  // borderRadius: BorderRadius.circular(40.0),
                  color: const Color(0xFF362C72).withOpacity(0.98),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Погода на неделю",
                      style: TextStyle(color: Colors.white38, fontSize: 20),
                    ),
                    const Divider(
                      color: Color(0xFF362C72),
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                    ),
                    WeekWidget(
                      name: widget.city,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreensHomeWidget(
                                                      city: widget.city),
                                            ),
                                          );
                                        },
                                        child: const Text("Добавить"),
                                      ),
                                    ],
                                    content: TextField(
                                      onChanged: (String value) {
                                        widget.city = value;
                                        textcontroller.clear();
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFF2E335A),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                        ),
                                        hintText: 'Поиск города',
                                        hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),),
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
                        const IconButtonPushListCityWidgets(),
                        const IconButtonPushSettingsWeather(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 813.1,
      width: 392.7,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/image/фон.png',
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}

class ImageHouse extends StatelessWidget {
  const ImageHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 392.7,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/image/House.png',
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}

class IconButtonPushGeolocation extends StatelessWidget {
  const IconButtonPushGeolocation({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GeolocationSity(),
          ),
        );
      },
      iconSize: 40,
      color: Colors.white70,
      icon: const Icon(Icons.place_outlined),
    );
  }
}

class IconButtonPushSettingsWeather extends StatelessWidget {
  const IconButtonPushSettingsWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsWeather(),
          ),
        );
      },
      iconSize: 40,
      color: Colors.white70,
      icon: const Icon(Icons.settings),
    );
  }
}

class IconButtonPushListCityWidgets extends StatelessWidget {
  const IconButtonPushListCityWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListCityWidget(),
          ),
        );
      },
      iconSize: 40,
      color: Colors.white70,
      icon: const Icon(Icons.format_list_bulleted_outlined),
    );
  }
}
//
//
// class ButtonShowAlertDialogEndSaveCity extends StatelessWidget {
//   ButtonShowAlertDialogEndSaveCity({super.key, required this.city});
//
//   final String city;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Введите город"),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreensHomeWidget(sity: city),
//               ),
//             );
//           },
//           child: const Text("Добавить"),
//         ),
//       ],
//       content: TextField(
//         onChanged: (String value) {
//           city = value;
//
//           textcontroller.clear();
//         },
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: const Color(0xFF2E335A),
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.white.withOpacity(0.6),
//           ),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//           ),
//           hintText: 'Поиск города',
//           hintStyle: TextStyle(
//             color: Colors.white.withOpacity(0.6),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black, width: 2.0),
//             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           ),
//         ),
//       ),
//     );
//   }
// }
