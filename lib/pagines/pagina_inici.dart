import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:firebase_adriacruz/chat/servei_chat.dart';
import 'package:firebase_adriacruz/components/item_usuari.dart';
import 'package:flutter/material.dart';

class PaginaInici extends StatefulWidget {
  const PaginaInici({super.key});

  @override
  State<PaginaInici> createState() => _PaginaIniciState();
}

class _PaginaIniciState extends State<PaginaInici> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text("Pagina d'inici"),
        actions: [
          IconButton(
            onPressed: () {
              ServeiAuth().ferLogout();

          },
           icon:Icon (Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: ServeiChat().getUsuaris(), 
        builder: (context,snapshot)  {


          //Cas que hi hagi un error.

          if(snapshot.hasError) {
            Text("Error en el snapshot");
          }

          if (snapshot.connectionState == ConnectionState.waiting){

            return const Text("Carregant dades ....");

           
          }

          //Es retornem les dades
          return ListView(
            children: snapshot.data!.map<Widget>(
              (dadesUsuari) => _construiexItemUsuari(dadesUsuari)
            
            ).toList(),

            
          );

        },
        ),
    );
  }


  Widget _construiexItemUsuari(Map<String,dynamic> dadesUsuari){

    return ItemUsuari(emailUsuari:dadesUsuari["email"]);

  }
}