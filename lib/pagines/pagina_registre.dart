

import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:firebase_adriacruz/components/boto_auth.dart';
import 'package:firebase_adriacruz/components/text_field_auth.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {

  final Function()? ferClic;

  const PaginaRegistre({
    super.key,
    required this.ferClic,
    });

  void ferRegistre(BuildContext context, String email, String password,
      String confPassword) async {
    if (password.isEmpty || email.isEmpty) {
      //Gestionar-ho.
      return;
    }

    if (password != confPassword) {
      //Gestio del cas.
      return;
    }

    String? error = await ServeiAuth().registreAmbEmailIPassword(email, password);

    if (error != null) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 250, 183, 159),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("Error"),
          content: Text(email),
        ),
      );
    }

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo.
                const Icon(
                  Icons.fireplace,
                  size: 120,
                  color: Color.fromARGB(255, 255, 240, 218),
                ),

                const SizedBox(
                  height: 25,
                ),

                //Frase.
                const Text(
                  "Crea un compte nou",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 240, 218),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //Text divisori.
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 5,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "Registra't",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 5,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                    ],
                  ),
                ),

                //TextField Email.

                TextFieldAuth(
                  controller: tecEmail,
                  obscureText: false,
                  hintText: "Escriu el teu emial...",
                ),

                //TextField Password

                TextFieldAuth(
                  controller: tecPassword,
                  obscureText: true,
                  hintText: "Escriu una password",
                ),

                //TextField Confirmar password

                TextFieldAuth(
                  controller: tecConfPass,
                  obscureText: true,
                  hintText: "Reescriu la teva password",
                ),

                const SizedBox(
                  height: 10,
                ),

                //No estas resgistrat/da?
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Ja ets membre?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: ferClic,
                        child: const Text(
                          "Fes login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 71, 97),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //Botó registrar't
                BotoAuth(
                  text: "Registra't",
                  onTap: () => ferRegistre(
                    context, tecEmail.text,
                      tecPassword.text, tecConfPass.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}