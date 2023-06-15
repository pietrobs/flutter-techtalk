import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 56, 106, 0),
            Color.fromARGB(255, 56, 211, 61)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            "https://assets10.lottiefiles.com/packages/lf20_4jsnlwpe.json",
            height: 300,
            fit: BoxFit.fill,
            repeat: true,
            reverse: true,
            animate: true,
          ),
          const Text("Faça chamadas para API do Rick and Morty")
        ],
      ),
    );
  }
}
