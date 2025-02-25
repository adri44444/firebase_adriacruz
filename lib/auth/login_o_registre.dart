
import 'package:firebase_adriacruz/pagines/pagina_login.dart';
import 'package:firebase_adriacruz/pagines/pagina_registre.dart';
import 'package:flutter/material.dart';

class LoginORegistre extends StatefulWidget {
  const LoginORegistre({super.key});

  @override
  State<LoginORegistre> createState() => _LoginORegistreState();
}

class _LoginORegistreState extends State<LoginORegistre> {

  bool mosstraPaginaLogin = true;

  void intercanviarPaginaLoginRegistre(){
    setState(() {
      mosstraPaginaLogin = !mosstraPaginaLogin;
    });

  }

  @override
  Widget build(BuildContext context) {
 
    if(mosstraPaginaLogin){
      return PaginaLogin(ferClic: intercanviarPaginaLoginRegistre,);
    } else{
      return PaginaRegistre(ferClic: intercanviarPaginaLoginRegistre,);
    }


  }
}