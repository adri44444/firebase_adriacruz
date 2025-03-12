import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_adriacruz/models/missatge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ServeiChat {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsuaris() {
    return _firestore.collection("Usuaris").snapshots().map((event) {
      return event.docs.map((document) {
        return document.data();
      }).toList();
    });
  }

  Future<void> enviarMissatge(String idReceptor, String missatge) async {
    // La sala de chat és entre dos usuaris. La creem a partir dels seus uid's.
    String idUsuariActual = _auth.currentUser!.uid;
    String emailUsuariActual = _auth.currentUser!.email!;
    Timestamp timestamp = Timestamp.now();

    Missatge nouMissatge = Missatge(
      idAutor: idUsuariActual,
      emailAutor: emailUsuariActual,
      idReceptor: idReceptor,
      missatge: missatge,
      timestamp: timestamp,
    );

    List<String> idUsuaris = [idUsuariActual, idReceptor];

    /*Ordenem la llista alfabèticament (així sempre és igual),
    de l'usuari que té la sessió oberta
    */
    idUsuaris.sort();

    String idSalaChat = idUsuaris.join("");

    await _firestore
        .collection("SalesChat")
        .doc(idSalaChat)
        .collection("Missatges")
        .add(
          nouMissatge.retornarMapaMissatge(),
        );
  }


  Stream<QuerySnapshot> getMissatges(String idUsuariActual,String idReceptor){


    //  Creem el idSalaChat, igual que quan guardem els misstages.
    List<String> idUsuaris = [idUsuariActual,idReceptor];
    idUsuaris.sort();
    String idSalaChat = idUsuaris.join("_");


    // Retornem els misstages d'aquesta SalaChat (d'aquesta collection).

    return _firestore.collection("SalesChat").doc(idSalaChat).collection("Missatges").orderBy("timestamp",descending:false).snapshots();
  }
}