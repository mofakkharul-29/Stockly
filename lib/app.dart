import 'package:flutter/material.dart';
import 'package:stockly/scratch_screen.dart';

class Stockly extends StatelessWidget {
  const Stockly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stockly',
      debugShowCheckedModeBanner: false,
      home: ScratchScreen(),
    );
  }
}
