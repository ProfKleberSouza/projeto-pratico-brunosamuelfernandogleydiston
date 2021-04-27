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
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Inscreva-se',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                autofocus: true,
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
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87, fontSize: 18.0),
                decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: const Color(0xff63dadb))
                ),
              ),
              // Botão de entrada
              SizedBox(
                height: 15.0 // Separar os campos
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
                        style: TextStyle(color: Colors.black87, fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Termos de Serviço',
                            style: TextStyle(color: const Color(0xff63dadb), fontSize: 16.0),
                            recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TO DO:
                                  // Colocar o link para lançar os termos de serviço aqui
                                  // launch('https://');
                                }
                          ),
                          TextSpan(
                              text: ' a e ',
                              style: TextStyle(color: Colors.black87, fontSize: 16.0)
                          ),
                          TextSpan(
                            text: 'Política de Privacidade',
                            style: TextStyle(color: const Color(0xff63dadb), fontSize: 16.0),
                            recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TO DO:
                                  // Colocar o link para lançar a política de privacidade aqui
                                  // launch('https://');
                                }
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis, // FIXME: Possivel bug
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0 // Separar os campos
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 180, height: 80),
                  child: ElevatedButton(
                    onPressed: agree ? gotoProfile : null,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(const Color(0xff63dadb)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: const Color(0xff63dadb))
                        ),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 22.0)
                    ),
                  ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Tem uma Conta?',
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Entrar',
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
}
