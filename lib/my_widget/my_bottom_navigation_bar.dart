import 'package:flutter/material.dart';

import '../widget_weather/geolocation.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  static List<Widget> _widgetOptions = <Widget>[
    GeolocationSity(),

  ];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
  color: Colors.white12);
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: Color(0xFF1F1D47),
      selectedLabelStyle: optionStyle,

      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
         backgroundColor: const Color(0xFF3B2F65),
          icon: const Icon(Icons.place_outlined),
            label: "Геопозиция",
        ),
        BottomNavigationBarItem(
          backgroundColor: const Color(0xFF3B2F65),
          icon: const Icon(Icons.add_circle_sharp),
          label: "Добавить",
        ),
        BottomNavigationBarItem(
          backgroundColor: const Color(0xFF3B2F65),
          icon: const Icon(Icons.format_list_bulleted_outlined),
            label: "Меню",
        ),
        BottomNavigationBarItem(
          backgroundColor: const Color(0xFF3B2F65),
          icon: const Icon(Icons.settings),
          label: "Настройки",
        )
      ],
    );
  }
}

