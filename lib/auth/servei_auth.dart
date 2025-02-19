
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ServeiAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<UserCredential> registraAmbEmailIPassword(String email, password)async {
      print("email:"+ email);
    try{
      UserCredential credentialUsuari =
    await _auth.createUserWithEmailAndPassword
    (email: email, 
    password: password,
    );

    _firestore.collection("Usuaris").doc(credentialUsuari.user!.uid).set({
      "uid":credentialUsuari.user!.uid,
      "email": email,
      "nom": "",
      });



    return credentialUsuari;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
      
    }

  }
}