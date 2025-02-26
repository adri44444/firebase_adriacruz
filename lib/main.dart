
import 'package:firebase_adriacruz/auth/portal_auth.dart';
import 'package:firebase_adriacruz/pagines/pagina_login.dart';
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

      home: PortalAuth()
      ,
    );
  }
}

/*
1)tenir Node.js instalat
  -En acabar, es pot cmprobar fent:
      node -v 
      npm -v
2) anar a la web de firebase i clicar a "Go to console",
  -Tenir en compte amb quin compte de google.
3) desde la consola de firebase ceeum un projecte de firebase
4)anem al menu compilacion y habilitem: 
Authentication y firestore database 
5) en un cm como la del VS Code, fem :
  npm install -g firebase-tools (aixo instala firebase)
6) flutter pub global activate flutterfire_cli

*/