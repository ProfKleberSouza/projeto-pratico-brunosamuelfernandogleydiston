import 'package:doar_app/widgets/profile_page.dart';
import 'package:doar_app/widgets/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 28.0, 
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Olá! Prazer em ver você de novo.',
                style: TextStyle(
                  color: Colors.black87, 
                  fontSize: 16.0, 
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 15.0,
              ),
              // Entrada do e-mail de usúario
              TextField(
                autofocus: true, // Define o autofoco no campo
                keyboardType: TextInputType
                    .emailAddress, // Permite escolher o tipo de teclado
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.cyanAccent),
                ),
              ),
              // Entrada da senha de usúario
              Divider(
                height: 15.0, // Separar os campos
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.cyanAccent)),
              ),
              // Botão de entrada
              SizedBox(
                height: 15.0 // Separar os campos
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 100),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyanAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.cyanAccent)),
                    ),
                  ),
                  child: Text('Entrar',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'ou use um de seus perfis sociais',
                style: TextStyle(color: Colors.black, fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SignInButton(
                      Buttons.GoogleDark,
                      text: "Inscreva-se com Google",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: SignInButton(
                      Buttons.FacebookNew,
                      text: "Inscreva-se com Facebook",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.black87, 
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text('Inscreva-se',
                        style: TextStyle(
                          color: Colors.cyanAccent, 
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
