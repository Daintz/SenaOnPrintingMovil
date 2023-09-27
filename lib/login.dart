import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'restore_password.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

   Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://senaonprintingapi.azurewebsites.net/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Autenticación exitosa
      final Map<String, dynamic> responseData = json.decode(response.body);
    final String token = responseData['token'];

    // Almacena el token en un lugar seguro, por ejemplo, utilizando shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inicio de Sesion Exitoso!', textAlign: TextAlign.center),
          backgroundColor: Color.fromRGBO(131, 179, 132, 1),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // Error de autenticación
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión. Verifica tus credenciales.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: Color(0xff00324D),
                    border: Border.all(color: Color(0xff00324D))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Image(
                        image: AssetImage("images/logo.png"),
                        height: 80,
                      )
                      //Text("Find Tech", textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 39, 82, 40), fontSize: 40, fontWeight: FontWeight.bold))
                    ])),
            SizedBox(height: 50),
            Image.asset(
              'images/logo_sena.jpeg',
              width: 150,
              height: 60, // Ancho de la imagen
            ),
            SizedBox(height: 15),
            Title(
                color: Colors.black,
                child: Text("Inicio de sesión",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _emailController,
                key: ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  icon: Icon(Icons.account_circle_rounded),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa un correo electrónico';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                key: ValueKey('password'),
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa una contraseña';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 45),
            ElevatedButton(
  style: ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 20),
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
  ),
  onPressed: _login,
  child: Text('Entrar'),
),

            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}
