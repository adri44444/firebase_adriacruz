

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:firebase_adriacruz/chat/servei_chat.dart';
import 'package:firebase_adriacruz/components/bombolla_misstage.dart';
import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String idReceptor;

  const PaginaChat({
    super.key,
    required this.idReceptor,
  });

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  final TextEditingController tecMissatge = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      ferScrollCapAvall();
    });
  }

  void ferScrollCapAvall() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 100 ,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("Sala chat"),
      ),
      body: Column(
        children: [
          //Zona missatges
          _crearZonaMostrarMissatges(),
          //Zona escriure missatges
          _crearZonaEscriureMissatges(),
        ],
      ),
    );
  }

  Widget _crearZonaMostrarMissatges() {
    return Expanded(
      child: StreamBuilder(
          stream: ServeiChat().getMissatges(
            ServeiAuth().GetUsuariActual()!.uid,
            widget.idReceptor,
          ),
          builder: (context, snapshot) {
            //Cas que hi hagi error.
            if (snapshot.hasError) {
              return const Text("Error carregant missatges.");
            }

            //Cas que este carregant les dades.
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Carregant missatges...");
            }

            //Retornar dades (missatges).
            return ListView(
              controller: _scrollController,
              children: snapshot.data!.docs
                  .map((document) => _construirItemMissatge(document))
                  .toList(),
            );
          }),
    );
  }

  Widget _construirItemMissatge(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    return BombollaMissatge(
      missatge: data["missatge"],
      idAutor: data["idAutor"],
    ); //Text(data["missatge"]);
  }

  _crearZonaEscriureMissatges() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: tecMissatge,
              decoration: InputDecoration(
                hintText: "Escriu el teu missatge...",
                filled: true,
                fillColor: Colors.amber[200],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: enviarMissatge,
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  void enviarMissatge() {
    if (tecMissatge.text.isNotEmpty) {
      ServeiChat().enviarMissatge(
        widget.idReceptor,
        tecMissatge.text,
      );

      tecMissatge.clear();
      Future.delayed(const Duration(milliseconds: 50), () {
      ferScrollCapAvall();
    });
      
    }
  }
}