import 'package:doar_project_flutter_app/widgets/profile_page.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              // Entrada do e-mail de usúario
              TextField(
                autofocus: true, // Define o autofoco no campo
                keyboardType: TextInputType.emailAddress, // Permite escolher o tipo de teclado
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.cyanAccent[100]
                  ),
                ),
              ),
              // Entrada da senha de usúario
              Divider(
                height: 10.0, // Separar os campos
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.cyanAccent[100])
                ),
              ),
              // Botão de entrada
              Divider(
                height: 10.0 // Separar os campos
              ),
              ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  // onPressed: () => {
                  onPressed: () {
                    print('button pressed');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  color: Colors.cyanAccent[100],
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}