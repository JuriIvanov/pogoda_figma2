import 'package:figma_pogoda2/repository/repository.dart';
import 'package:flutter/material.dart';

import '../my_directory_with_pogoda/model/jsonPogodaModel.dart';

class HomePogodaWidget extends StatefulWidget {
  const HomePogodaWidget({super.key});

  @override
  State<HomePogodaWidget> createState() => _HomePogodaWidgetState();
}

class _HomePogodaWidgetState extends State<HomePogodaWidget> {
  final jsonPogodaModel = JsonPogodaModel();
  final repository = Repository();

  List<String> listname = [
    "Москва",
    "Казань",
    "Казань",
    "Казань",
    "Казань",
    "Казань"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                onSubmitted: (String text) {
                  listname.add(text);
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 165,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: listname.length,
                itemBuilder: (BuildContext context, int index) {
                  print(listname.length);
                  print(index);
                  return FutureBuilder<JsonPogodaModel?>(
                    future: repository.fetchPogoda(listname[index]),
                    builder: (BuildContext context,
                        AsyncSnapshot<JsonPogodaModel?> snapshot) {
                      if (snapshot.hasData) {
                        final String? iconcondition = snapshot.data?.forecast!
                            .forecastday?[index].day?.condition?.icon;
                        final int? tempC = snapshot
                            .data?.forecast!.forecastday?[index].day?.avgtempC
                            ?.round();
                        final String strTempC = '$tempC°';

                        return SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color:
                                    const Color(0xFF312D56).withOpacity(0.35),
                                border: Border.all(
                                    color: const Color(0xFF4F3275), width: 3),
                              ),
                              width: 60,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      snapshot.data!.location!.name.toString()),
                                  Text(
                                    DateTime.parse(snapshot.data!.forecast!
                                            .forecastday![index].date!)
                                        .day
                                        .toString(),
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Image.network(
                                    "http:$iconcondition",
                                  ),
                                  Text(
                                    strTempC,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

                      } else {
                        return const Text('Пока нет данных');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
