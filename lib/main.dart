

import 'package:firebase_adriacruz/auth/portal_auth.dart';
import 'package:firebase_adriacruz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(Firebase.apps.isEmpty){

    try{

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e){
      print("Error iniciant Firebase");
    }

  }else{
    print("Error, Firebase ja està inicialitzat");
  }



  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortalAuth(),
    );
  }
}


/*
1) Tenir Node.js instalat
  -En acabar, es pot comprobar fent:
    node -v
    nom -v

2) Anar a la web de Firebase i clicar a "Go to console".
  
Tenir en compte amb quin compte de Google estas.

3) Des de la consola de Firebase, creem un projecte de Firebase.

4) Anem al menu Compilación i habilitem:
    Authentication i Firestore Databas

5) En una cmd per exemple la del VS Code, fem:
    npm install -g firebase-tools
    (això instala Firebase al dispositiu)
    Pot fer falta fer abans:
     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

6) dart pub global activate flutterfire_cli

7) flutterfire configure
   
Seleccionem el projecte de Firebase
    amb el que el volem vincular.
Deiexem seleccionats només els dispositius amb els que 
  volem que funcioni l'aplicació (en aquest cas android i web).


8) Instal.lem les dependències de Firebase que vulguem utilizar:
   
flutter pub add firebase_core
flutter pub add firebase_auth(amb això, marxen els errors de firebase_options.dart)

*/