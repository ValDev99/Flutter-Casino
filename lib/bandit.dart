import 'package:flutter/material.dart';
import 'dart:math';

class Casino extends StatefulWidget {
  const Casino({super.key, required this.title});

  final String title;

  @override
  State<Casino> createState() => _CasinoState();
}

class _CasinoState extends State<Casino> {
  final List<String> _icons = [
    'images/bar.png',
    'images/cerise.png',
    'images/cloche.png',
    'images/diamant.png',
    'images/fer-a-cheval.png',
    'images/pasteque.png',
    'images/sept.png',
  ];

  List<String> _selectedIcons = [
    'images/sept.png',
    'images/sept.png',
    'images/sept.png',
  ];

  String _message = '';

  void _retryGame() {
    setState(() {
      final random = Random();
      _selectedIcons = List.generate(3, (index) => _icons[random.nextInt(_icons.length)]);

      if (_selectedIcons[0] == _selectedIcons[1] && _selectedIcons[1] == _selectedIcons[2]) {
        if (_selectedIcons[0] == 'assets/sept.png') {
          _message = 'INCREDIBLE JACKPOT 777 🎉🎉🎉';
        } else {
          _message = 'Jackpot !';
        }
      } else {
        _message = 'You lost money again, try to take it back !';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _selectedIcons.map((iconPath) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(iconPath, width: 50, height: 50), // Affichage des icônes
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            _message,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Center(
            child: FloatingActionButton.extended(
              onPressed: _retryGame,
              label: const Text('GO !'),
            ),
          ),
        ],
      ),
    );
  }
}
