import 'package:figma_pogoda2/state/counter_state.dart';

import 'package:flutter/material.dart';

import '../my_directory_with_pogoda/model/jsonPogodaModel.dart';
import '../my_directory_with_pogoda/view/view_list_container_with_city/wideget_for_list_city/my_custom_clipper.dart';
import '../repository/repository.dart';

class ListCityWidget extends StatefulWidget {
  const ListCityWidget({super.key});

  @override
  State<ListCityWidget> createState() => _ListCityWidgetState();
}

final jsonPogodaModel = JsonPogodaModel();

final repository = Repository();

class _ListCityWidgetState extends State<ListCityWidget> {
  @override

  void initState() {
    counter.observableList.add('Казань');
    super.initState();
  }
  final CounterState counter = CounterState();

  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: //Theme.of(context).colorScheme.background,
      const Color(0xFF1F1D47),
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          ' Погода',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Row(
                    children: [
                      Text('Сменить тему'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.color_lens_outlined,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: const Icon(
              Icons.more_horiz_sharp,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: const Color(0xFF1F1D47),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: counter.observableList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FutureBuilder<JsonPogodaModel?>(
                    future: repository.fetchPogoda(counter.observableList[index]),
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
                              counter.observableList.removeAt(index);
                            });
                          },
                          key: UniqueKey(),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                counter.onCityTap(index, context);
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
                                                  strTempC,
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
                                                  tempString,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFFFFFFFF)
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
                                    // Image.network(
                                    //   "http:$iconcondition",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ],
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
                        counter.observableList.add(sity);
                        setState(() {

                        });

                      }
                      textcontroller.clear();
                    },
                    cursorColor: Colors.white,
                    textAlignVertical: const TextAlignVertical(y: 1),
                    style: const TextStyle(color: Colors.white),
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1F1D47),
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
          ),
        ],
      ),
    );
  }
}
