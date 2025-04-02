import 'package:flutter/material.dart';

class RecoveyPassword extends StatefulWidget {
  const RecoveyPassword({super.key});

  @override
  State<RecoveyPassword> createState() => _RecoveyPasswordState();
}

class _RecoveyPasswordState extends State<RecoveyPassword> {

  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/logo.png"),
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        labelText: "Correo electronico"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text("Recuperar contraseña"),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
