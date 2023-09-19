import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/main.dart';
import 'restore_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

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
                key: ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    icon: Icon(Icons.account_circle_rounded)),
                validator: (value) {
                  if (value!.isEmpty ||
                      !value.contains('@') ||
                      value != "root@root.com") {
                    return 'Formato de correo invalido';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                key: ValueKey('password'),
                decoration: InputDecoration(
                    labelText: 'Contraseña', icon: Icon(Icons.lock)),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length < 8 ||
                      value != "root1234") {
                    return 'La contraseña debe tener al menos 8 caracteres';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 45),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  padding: EdgeInsets.only(
                      top: 10, bottom: 10, left: 30, right: 30)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Inicio de Sesion Exitoso!',
                            textAlign: TextAlign.center),
                        backgroundColor: Color.fromRGBO(131, 179, 132, 1)),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RestorePassword()));
              },
              child: Text('¿Has olvidado tu contraseña?, Restaurela!'),
            )
          ],
        ),
      ),
    ));
  }
}
