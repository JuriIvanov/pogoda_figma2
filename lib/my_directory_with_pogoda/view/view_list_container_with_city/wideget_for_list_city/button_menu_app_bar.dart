import 'package:flutter/material.dart';

class ButtonMenuAppBar extends StatelessWidget {
  const ButtonMenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
    );
  }
}

