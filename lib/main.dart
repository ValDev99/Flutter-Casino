import 'package:flutter/material.dart';

void main() {
  runApp(const Casino());
}

class Casino extends StatefulWidget {
  const Casino({super.key});

  @override
  State<Casino> createState() => _CasinoState();
}

class _CasinoState extends State<Casino> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

