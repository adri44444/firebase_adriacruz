


import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:firebase_adriacruz/chat/servei_chat.dart';
import 'package:firebase_adriacruz/components/item_usuari.dart';
import 'package:firebase_adriacruz/pagines/pagina_chat.dart';
import 'package:flutter/foundation.dart';
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
        title: Text(ServeiAuth().GetUsuariActual()!.email!),
        actions: [
          IconButton(
            onPressed: () {
              ServeiAuth().ferLogout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: ServeiChat().getUsuaris(),
        builder: (context, snapshot) {
          // Cas que hi hagi un error
          if (snapshot.hasError) {
            return const Text("Error en el snapshot");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Carregant dades...");
          }

          // Es retornen les dades
          return ListView(
            children: snapshot.data!
                .map(<Widget>(dadesUsuaris) =>
                    _construeixItemUsuari(dadesUsuaris))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _construeixItemUsuari(Map<String, dynamic> dadesUsuari) {
    if (dadesUsuari["email"] == ServeiAuth().GetUsuariActual()!.email) {
      return Container();
    }

    return ItemUsuari(
      emailUsuari: dadesUsuari["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaChat(
              idReceptor: dadesUsuari["uid"],
            ),
          ),
        );
      },
    );
  }
}