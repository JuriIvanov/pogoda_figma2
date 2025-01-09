import 'package:flutter/material.dart';

class GeolocationSity extends StatelessWidget {
  const GeolocationSity({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const BackButton(),


      ),
      body: const Center(
        child: Text('Ваш город Дербент!'),
      ),
    );
  }
}
