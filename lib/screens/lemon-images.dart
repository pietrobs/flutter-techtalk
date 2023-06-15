import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lemon/constants/lemon.dart';
import 'package:lemon/models/Lemon.dart';

class LemonImages extends StatefulWidget {
  const LemonImages({Key? key}) : super(key: key);

  @override
  _LemonImagesState createState() => _LemonImagesState();
}

class _LemonImagesState extends State<LemonImages> {
  Lemon selectedLemon = lemons[Random().nextInt(lemons.length)];

  void _getRandomLemon() {
    setState(() {
      selectedLemon = lemons[Random().nextInt(lemons.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Algo incrível feito com limão...",
            style: TextStyle(fontSize: 24),
          ),
          Image.network(
            selectedLemon.image,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
          ),
          Text(selectedLemon.text),
          ElevatedButton(
            onPressed: _getRandomLemon,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh),
                SizedBox(width: 8),
                Text("Nova imagem"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
