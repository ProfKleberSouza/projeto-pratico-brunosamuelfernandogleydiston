import 'package:doar_app/widgets/profile_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool agree = false;
  // Esta função é ativada quando o botão e clicado
  void gotoProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
  }
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
              Text(
                'Inscreva-se',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
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
                height: 10.0, // Separar os campos
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.cyanAccent)
                ),
              ),
              // Botão de entrada
              Divider(
                height: 10.0 // Separar os campos
              ),
              Row(
                children: <Widget>[
                  Material(
                    child: Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Text.rich(
                      TextSpan(
                        text: 'Eu concordo com os Termos de ',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Termos de Serviço',
                            style: TextStyle(color: Colors.cyanAccent, fontSize: 16.0),
                            recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Bloco aberto
                                  // Colocar o link para lançar os termos de serviço aqui
                                  // launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                                }
                          ),
                          TextSpan(
                              text: ' a e ',
                              style: TextStyle(color: Colors.black, fontSize: 16.0)
                          ),
                          TextSpan(
                            text: 'Política de Privacidade',
                            style: TextStyle(color: Colors.cyanAccent, fontSize: 16.0),
                            recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Bloco aberto
                                  // Colocar o link para lançar a política de privacidade aqui
                                  // launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                                }
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 10.0 // Separar os campos
              ),
              ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 100),
                  child: ElevatedButton(
                    onPressed: agree ? gotoProfile : null,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyanAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.cyanAccent)
                        ),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)
                    ),
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Tem uma Conta?',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Retorna para a tela de Login
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 16.0,
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
}