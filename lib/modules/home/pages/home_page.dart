import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Modular.to.pushNamed("/posts/");
            },
            child: const Text("Posts"),
          ),
        ),
      ],
    ));
  }
}
