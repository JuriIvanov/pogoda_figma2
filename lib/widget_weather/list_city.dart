import 'package:figma_pogoda2/widget_weather/screens_home_widget.dart';
import 'package:flutter/material.dart';

import '../model/jsonPogodaModel.dart';
import '../repository/repository.dart';

class ListCityWidget extends StatefulWidget {
  const ListCityWidget({super.key});

  @override
  State<ListCityWidget> createState() => _ListCityWidgetState();
}

final jsonPogodaModel = JsonPogodaModel();

final repository = Repository();

class _ListCityWidgetState extends State<ListCityWidget> {
  List<String> listname = [
    "Казань",
    'Ростов',
  ];
  final textcontroller = TextEditingController();

  void _onCityTap(int index) {
    final id = listname[index];
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return ScreensHomeWidget(sity: id);
      }),
    );
  }
  Color color = const Color(0xFF362762);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              color = Colors.blueGrey;
              setState(() {

              });
            },
          ),
        ],
        backgroundColor: const Color(0xFF362762),
        title: const Text(
          ' Погода',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: listname.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FutureBuilder<JsonPogodaModel?>(
                    future: repository.fetchPogoda(listname[index]),
                    builder: (BuildContext context,
                        AsyncSnapshot<JsonPogodaModel?> snapshot) {
                      if (snapshot.hasData) {
                        final String? conditionText =
                            snapshot.data?.current?.condition?.text;
                        final String? location =
                            snapshot.data?.location?.name.toString();

                        final String? iconcondition =
                            snapshot.data?.current?.condition?.icon;

                        final int? tempC =
                            snapshot.data?.current?.tempC?.round();

                        final String strTempC = '$tempC°';
                        int? maxtempC = snapshot
                            .data?.forecast!.forecastday![0].day!.maxtempC
                            ?.round();
                        int? mintempC = snapshot
                            .data?.forecast!.forecastday![0].day!.mintempC
                            ?.round();
                        String tempString = "Макс: $maxtempC°  Мин: $mintempC°";
                        return Dismissible(
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              listname.removeAt(index);
                            });
                          },
                            key: UniqueKey(),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _onCityTap(index),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Container(
                                height: 184,
                                width: 342,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF5735B1),
                                  borderRadius: BorderRadius.circular(30),
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
                                            strTempC,
                                            style: const TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 72,
                                                height: 0.85,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            tempString,
                                            style: TextStyle(
                                              color: const Color(0xFFFFFFFF)
                                                  .withOpacity(0.6),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            location!,
                                            style: const TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      right: 20,
                                      child: Image.network(
                                        "http:$iconcondition",
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 20,
                                      child: Text(
                                        conditionText!,
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
                          ),
                        );
                      } else {
                        return const Text('Ошибка');
                      }
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 42,
                  width: 352,
                  child: TextField(
                    controller: textcontroller,
                    onSubmitted: (String sity) {
                      if (sity.isNotEmpty) {
                        listname.add(sity);

                        setState(() {});
                      }
                      textcontroller.clear();
                    },
                    cursorColor: Colors.white,
                    textAlignVertical: const TextAlignVertical(y: 1),
                    style: const TextStyle(color: Colors.white),
                    obscureText: false,
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
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
