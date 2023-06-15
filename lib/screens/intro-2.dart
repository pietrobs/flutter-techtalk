import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 26, 73, 27),
            Color.fromARGB(255, 128, 179, 71),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            "https://assets5.lottiefiles.com/packages/lf20_qAoLpDJx0R.json",
            height: 300,
            fit: BoxFit.fill,
            repeat: true,
            reverse: true,
            animate: true,
          ),
          const Text("Veja imagens incríveis de coisas feitas com limão")
        ],
      ),
    );
  }
}
