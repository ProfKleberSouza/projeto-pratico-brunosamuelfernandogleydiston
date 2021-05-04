import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_signin_button/flutter_signin_button.dart";
import "package:doar_app/screens/profilescreen.dart";
import "package:doar_app/screens/signinscreen.dart";
import "package:doar_app/design/layoutcolors.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBackgroundColor,
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
                  color: whiteBackgroundColor,
                  child: Image.asset(
                    "assets/images/logo.png",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Entrar",
                style: TextStyle(
                  color: blackUserTextColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Olá! Prazer em ver você de novo.",
                style: TextStyle(
                  color: blackFixedTextColor,
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
                style: TextStyle(
                  color: blackUserTextColor,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: cyanThemeColor),
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
                style: TextStyle(
                  color: blackUserTextColor,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: cyanThemeColor),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80, height: 50),
                child: ElevatedButton(
                  onPressed: () {
                    logInToFb();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(whiteBackgroundColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(cyanThemeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: cyanThemeColor),
                      ),
                    ),
                  ),
                  child: Text("Entrar",
                      style: TextStyle(
                        color: whiteBackgroundColor,
                        fontSize: 22.0,
                      )),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "ou use um de seus perfis sociais",
                style: TextStyle(
                  color: blackFixedTextColor,
                  fontSize: 16.0,
                ),
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
                      text: "Inscreva-se com Google",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: SignInButton(
                      Buttons.Facebook,
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
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: blackUserTextColor,
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
                            MaterialPageRoute(builder: (context) => SignInScreen()));
                      },
                      child: Text(
                        "Inscreva-se",
                        style: TextStyle(
                          color: cyanThemeColor,
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
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
    ).catchError(
      (error) {
        print(error.message);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Usuário Inválido"),
              actions: [
                ElevatedButton(
                  child: Text("Ok"),
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

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
