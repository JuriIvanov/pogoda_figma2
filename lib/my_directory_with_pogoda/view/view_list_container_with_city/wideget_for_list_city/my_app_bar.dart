
import 'package:flutter/material.dart';

import 'button_menu_app_bar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1F1D47),
      leading: const BackButton(
        color: Colors.white,
      ),
      title: const Text(
        ' Погода',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
      actions: const [
        ButtonMenuAppBar(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

