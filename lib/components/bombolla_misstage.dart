import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BombollaMisstage extends StatelessWidget {
  final String misstage;
  const BombollaMisstage({super.key,
  required this.misstage
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
      child: Container(
        color: Colors.amber[200],
        child: Text(misstage),
      ),
    );
  }
}