import 'package:figma_pogoda2/model/jsonPogodaModel.dart';
import 'package:flutter/material.dart';

import '../my_widget/week_widget.dart';
import '../repository/repository.dart';

class ScreensHomeWidget extends StatelessWidget {
  final String sity;

  ScreensHomeWidget({
    super.key,
    required this.sity,
  });

  final jsonPogodaModel = JsonPogodaModel();

  final repository = Repository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 813.1,
              width: 392.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/image/фон.png',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Center(
              child: FutureBuilder<JsonPogodaModel?>(
                future: repository.fetchPogoda(sity),
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
            Positioned(
              top: 300,
              child: Container(
                height: 400,
                width: 392.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/image/House.png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
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
                      name: sity,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            iconSize: 32,
                            color: Colors.white70,
                            icon: const Icon(Icons.place_outlined)),
                        const SizedBox(
                          width: 105,
                        ),
                        IconButton(
                            onPressed: () {},
                            iconSize: 50,
                            color: Colors.white,
                            icon: const Icon(Icons.add_circle_sharp)),
                        const SizedBox(
                          width: 90,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 32,
                            color: Colors.white70,
                            icon: const Icon(
                                Icons.format_list_bulleted_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
