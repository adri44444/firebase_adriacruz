import 'package:flutter/material.dart';

class BotoAuth extends StatelessWidget {
  final String text;
  final Function() onTap;

  const BotoAuth({
    super.key,
    required this.text,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 244, 111, 54),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.orange[100],
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 4,
            ),
            
            ),
        ),
      ),
    );
  }
}