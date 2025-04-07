import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum Genre { male, female}

class _SignUpPageState extends State<SignUpPage> {

  Genre? _genre = Genre.male;

  bool _isPasswordObscure = true;
  bool _isRepPasswordObscure = true;

  String buttonMsg = "Fecha de nacimiento";

  DateTime _bornDate = DateTime.now();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo electronico",
                    prefixIcon: Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Debe digitar un correo electronico";
                    } else {
                      if (!value!.isValidEmail()) {
                        return "El correo electronico no es valido";
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _password,
                  obscureText: _isPasswordObscure,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                      ),
                      labelText: "Contraseña"),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _repPassword,
                  obscureText: _isRepPasswordObscure,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isRepPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isRepPasswordObscure = !_isRepPasswordObscure;
                          });
                        },
                      ),
                      labelText: "Repita la contraseña"),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 16,
                ),
                const Text("Seleccione su genero"),
                Row (
                  children: [
                    Expanded(
                    child: RadioListTile(
                      title: const Text("Masculino"),
                      value: Genre.male,
                      groupValue: _genre,
                      onChanged: (Genre? value){
                        setState(() {
                          _genre = value;
                        });
                      },
                    ),
                  ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Femenino"),
                        value: Genre.female,
                        groupValue: _genre,
                        onChanged: (Genre? value){
                          setState(() {
                            _genre = value;
                          });
                        },
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    _showSelectedDate();
                    },
                  child: Text(buttonMsg),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    _onRegisterButtonClicked();
                  },
                  child: const Text("Registarse")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onRegisterButtonClicked() {

  }

  void _showSelectedDate() async{
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1925, 1),
      lastDate: DateTime.now(),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null){
      setState(() {
        buttonMsg = "Fecha de nacimiento: ${_dateConverter(newDate)}";
      });
    }
  }

  String _dateConverter(DateTime date){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(date);
    return dateFormatted;
  }

}

extension on String{
  bool isValidEmail(){
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    ).hasMatch(this);
  }
}