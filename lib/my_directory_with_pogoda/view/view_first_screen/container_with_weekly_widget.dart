
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_first_screen/row_button_widget.dart';
import 'package:figma_pogoda2/my_directory_with_pogoda/view/view_first_screen/weekly_widget_container.dart';
import 'package:flutter/material.dart';

class ContainerWithWeeklyWidget extends StatelessWidget {
  const ContainerWithWeeklyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 392.7,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          transform: GradientRotation(25),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3B2F65),
            Color(0xFF3B2F65),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        // borderRadius: BorderRadius.circular(40.0),
        color: const Color(0xFF362C72).withOpacity(0.98),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Погода на неделю",
            style: TextStyle(color: Colors.white38, fontSize: 20),
          ),
          const Divider(
            color: Color(0xFF362C72),
            indent: 20,
            endIndent: 20,
            thickness: 3,
          ),
          const WeeklyWidgetContainer(),
          const SizedBox(
            height: 12,
          ),
          RowButtonWidget(),
        ],
      ),
    );
  }
}
