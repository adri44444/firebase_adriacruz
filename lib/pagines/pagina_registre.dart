import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:firebase_adriacruz/components/boto_auth.dart';
import 'package:firebase_adriacruz/components/text_field_auth.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {
  const PaginaRegistre({super.key});

  void ferRegistre() {

    final ServeiAuth serveiAuth = ServeiAuth();

    serveiAuth.registraAmbEmailIPassword("email1@email1.com", "123456");
    
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
        final TextEditingController tecPassword = TextEditingController();
            final TextEditingController tecConfPass = TextEditingController();


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                Icons.fireplace,
                size: 120,
                color: Color.fromARGB(255, 255, 240, 218),
              ),
        
              const SizedBox(height: 25),
        
              // Frase
              const Text(
                "crea un compte nou",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 240, 218),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height: 25),
        
              // Text divorsi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 255, 240, 218),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "registrat",
                        style: TextStyle(color: Color.fromARGB(255, 255, 240, 218)),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 255, 240, 218),
                      ),
                    ),
                  ],
                ),
              ),
        
              // Texfield email
               TextFieldAuth(
                controller:tecEmail ,
                obscureText: false,
                hintText: "Escriu el teu email",
                ),
        
        
              // Texfield password
                TextFieldAuth(
                controller: tecPassword,
                obscureText: true,
                hintText: "Tria un password",
                ),
        
        
              // texfield confirmar password
               TextFieldAuth(
                controller: tecConfPass,
                obscureText: true,
                hintText: "Reescriu el password",
                ),
        
                const SizedBox(height: 10,),
        
        
              // no estas registrat
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Ja ets membre?"),
                    const SizedBox(width: 5,),
                    Text("fes login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 40, 71, 97),
                    ),
                    ),
                
                  ],
                ),
              ),

              const SizedBox(height: 10),

              //Boto registrat 
              BotoAuth(
                text: "Registra't",
                onTap: ferRegistre,
              ),
              BotoAuth(
                text: "Logout",
                onTap: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
