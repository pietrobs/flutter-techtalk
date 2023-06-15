import 'package:flutter/material.dart';
import 'package:lemon/screens/home.dart';
import 'package:lemon/screens/intro-1.dart';
import 'package:lemon/screens/intro-2.dart';
import 'package:lemon/screens/intro-3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              onLastPage = value == 2;
            });
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        // dots
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _goToHome,
                child: const Text("skip"),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                effect: const WormEffect(
                  dotColor: Colors.white,
                  activeDotColor: Colors.lime,
                ),
              ),
              onLastPage
                  ? GestureDetector(
                      onTap: _goToHome,
                      child: const Text("done"),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text("next"),
                    )
            ],
          ),
        )
      ],
    ));
  }
}
