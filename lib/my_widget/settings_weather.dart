import 'package:flutter/material.dart';

class SettingsWeather extends StatelessWidget {
  const SettingsWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D47),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.color_lens_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Изменить фон',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.font_download,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Настроить шрифт',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 58),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Избранные города',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 50),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Градусы/Фаренгейты',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Настройки',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 28),
        ),
        backgroundColor: const Color(0xFF1F1D47),
      ),
    );
  }
}

class RowSettings {
  RowSettings(Icon parametr_icon, Text title, Icon next) {}

  SizedBox indent_otstup = const SizedBox(
    width: 20,
  );
  Row row_settings = const Row();
}
