


import 'package:firebase_adriacruz/auth/servei_auth.dart';
import 'package:firebase_adriacruz/components/boto_auth.dart';
import 'package:firebase_adriacruz/components/text_field_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaLogin extends StatelessWidget {
  final Function()? ferClic;

  const PaginaLogin({
    super.key,
    required this.ferClic,
  });

  void ferLogin(BuildContext context, String email, String password) async {
    String? error = await ServeiAuth().loginAmbEmailIPassword(
      email,
      password,
    );

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
          content: const Text("Email i/o password incorrectes."),
        ),
      );
    } else {
      print("Login fet");
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();
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
                  "Benvingut/da de nou",
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
                          "Fes login",
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
                  hintText: "Escriu el teu email...",
                ),

                //TextField Password

                TextFieldAuth(
                  controller: tecPassword,
                  obscureText: true,
                  hintText: "Escriu una password",
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
                      const Text("Encara no ets membre?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: ferClic,
                        child: const Text(
                          "Registra't",
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
                  text: "Login",
                  onTap: () =>
                      ferLogin(context, tecEmail.text, tecPassword.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
