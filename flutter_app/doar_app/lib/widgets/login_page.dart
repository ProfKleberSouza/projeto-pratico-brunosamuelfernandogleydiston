import 'package:firebase_auth/firebase_auth.dart';
import 'package:doar_app/widgets/profile_page.dart';
import 'package:doar_app/widgets/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          //      key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  alignment: Alignment.center,
                  height: 150.0,
                  width: 150.0,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/logo.png',
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.black87,
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
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                autofocus: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black87, fontSize: 18.0),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: const Color(0xff63dadb)),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87, fontSize: 18.0),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: const Color(0xff63dadb)),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100, height: 50),
                child: ElevatedButton(
                  onPressed: () {
                    logInToFb();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff63dadb)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: const Color(0xff63dadb)),
                      ),
                    ),
                  ),
                  child: Text('Entrar',
                      style: TextStyle(color: Colors.white, fontSize: 22.0)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'ou use um de seus perfis sociais',
                style: TextStyle(color: Colors.black87, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SignInButton(
                      Buttons.Google,
                      text: 'Inscreva-se com Google',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: SignInButton(
                      Buttons.Facebook,
                      text: 'Inscreva-se com Facebook',
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        'Inscreva-se',
                        style: TextStyle(
                          color: const Color(0xff63dadb),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
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

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then(
      (result) {
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      },
    ).catchError(
      (error) {
        print(error.message);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Usuário Inválido'),
              actions: [
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
