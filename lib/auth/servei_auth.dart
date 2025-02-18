
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ServeiAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> registraAmbEmailIPassword(String email, password)async {

    try{
      UserCredential credentialUsuari =
    await _auth.createUserWithEmailAndPassword
    (email: email, 
    password: password,
    );
    return credentialUsuari;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
      
    }

  }
}