import 'package:firebase_adriacruz/pagines/pagina_registre.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home:PaginaRegistre(

      ),
    
      
    );
  }
}

/*
1) Tenir node.js instalat.
- En acabar,es pot comprobar fent;

node -v
npm -v


2) anar a la web de firebase i clicar a go to console.
tenir en compte amb quin compte  de google

3) desde la consola firebase creeem un projeccte firebase.

4) anem al menu compilacion i habilitem :Authentication i firestore database.

5) en una cmd,per exemple la del vs code,fem:
npm install -g firebase-tools

*/
