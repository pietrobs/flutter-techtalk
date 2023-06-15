import 'package:flutter/material.dart';
import 'package:lemon/screens/animation.dart';
import 'package:lemon/screens/lemon-images.dart';
import 'package:lemon/screens/rick-and-morty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lemon Energy"),
        actions: [
          IconButton(
            icon: const Icon(Icons.animation),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AnimationScreen();
              }));
            },
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            activePage = value;
          });
        },
        children: const [
          LemonImages(),
          RickAndMorty(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _controller.animateToPage(
            value,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() {
            activePage = value;
          });
        },
        currentIndex: activePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: "Fotos de coisas de limão",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: "Rick and Morty API",
          ),
        ],
      ),
    );
  }
}
