import 'package:flutter/material.dart';
import 'package:lemon/widgets/flutuant-lemon.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 112, 163, 113),
            Color.fromARGB(255, 85, 151, 11),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutuantLemon(),
          const SizedBox(height: 16),
          const Text("Veja um limão flutuante")
        ],
      ),
    );
  }
}
