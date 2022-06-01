import 'package:flutter/material.dart';

class Deck extends StatefulWidget {
  Deck({Key? key}) : super(key: key);

  @override
  State<Deck> createState() => _DeckState();
}

class _DeckState extends State<Deck> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Coming Soon..."),
    );
  }
}
