import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutuantLemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "🍋",
          style: TextStyle(fontSize: 200),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .moveY(
              begin: -25,
              end: 15,
              duration: 1000.ms,
              curve: Curves.easeInOut,
            )
            .then()
            .moveY(
              begin: 15,
              end: -25,
              duration: 1000.ms,
              curve: Curves.easeInOut,
            ),
        Container(
          width: 150,
          height: 15,
          decoration: const BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.all(Radius.elliptical(150, 15)),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .scaleXY(
              begin: 1.2,
              end: 0.8,
              duration: 1000.ms,
              curve: Curves.easeInOut,
            )
            .then()
            .scaleXY(
              begin: 0.8,
              end: 1.2,
              duration: 1000.ms,
              curve: Curves.easeInOut,
            ),
      ],
    );
  }
}
