import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:flutter/material.dart';

class BombollaMissatge extends StatelessWidget {
  final String missatge;
  final String idAutor;

  const BombollaMissatge({
    super.key,
    required this.missatge,
    required this.idAutor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
      child: Align(
        alignment: idAutor== ServeiAuth().GetUsuariActual()! .uid
          ?Alignment.centerRight
         :Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: idAutor== ServeiAuth().GetUsuariActual()! .uid? Colors.green[400]:Colors.amber[400],
            borderRadius: BorderRadius.circular(10),
          ),
        
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(missatge),
          ),
        ),
      ),
    );
  }
}