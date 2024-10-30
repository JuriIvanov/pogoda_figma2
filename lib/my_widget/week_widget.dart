import 'package:flutter/material.dart';

import '../model/jsonPogodaModel.dart';
import '../repository/repository.dart';

class WeekWidget extends StatelessWidget {
  WeekWidget({super.key, required this.name});

  final repository = Repository();
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder<JsonPogodaModel?>(
                future: repository.fetchPogoda(name),
                builder: (BuildContext context,
                    AsyncSnapshot<JsonPogodaModel?> snapshot) {
                  if (snapshot.hasData) {
                    final String date =
                        snapshot.data!.forecast!.forecastday![index].date!;
                    final dataTime = DateTime.parse(date).day;
                    final String? iconcondition = snapshot.data!.forecast!
                        .forecastday?[index].day?.condition?.icon;
                    final int? tempC = snapshot
                        .data!.forecast!.forecastday![index].day!.avgtempC
                        ?.round();
                    final String strTempC = '$tempC°';
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: const Color(0xFF312D56).withOpacity(0.35),
                            border: Border.all(
                                color: const Color(0xFF4F3275), width: 3)),
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text(
                                dataTime.toString(),
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Image.network(
                              "http:$iconcondition",
                            ),
                            Text(strTempC,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Text('Ошибка, данные не найдены!');
                  }
                });
          }),
    );
  }
}
