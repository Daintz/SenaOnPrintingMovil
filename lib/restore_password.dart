import 'package:flutter/material.dart';

import 'login.dart';

class RestorePassword extends StatefulWidget {
  const RestorePassword({super.key});

  @override
  State<RestorePassword> createState() => _RestorePasswordState();
}

class _RestorePasswordState extends State<RestorePassword> {
  final _restorePassKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center
        ),
      ),
      body: Form(
        key: _restorePassKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 35),
              Title(color: Colors.black, child: Text("Restaurar Contraseña", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
              SizedBox(height: 50),
              TextFormField(
                key: ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Correo Electrónico', icon: Icon(Icons.account_circle_rounded)),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Formato de correo invalido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 45),
              ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30)),
                onPressed: () {
                   if (_restorePassKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Correo de Restauracion Enviado', textAlign: TextAlign.center), backgroundColor: Color.fromRGBO(131, 179, 132, 1)),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  }
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      )
    );
  }
}