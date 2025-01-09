
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/state_home_screen.dart';

class TextFieldViewListCity extends StatelessWidget {
  const TextFieldViewListCity({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<WeatherState>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 42,
            width: 352,
            child: TextField(
              onSubmitted: state.addCityToObservableList,
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
    );
  }
}