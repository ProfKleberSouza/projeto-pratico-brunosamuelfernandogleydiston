import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_database/firebase_database.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:doar_app/screens/profilescreen.dart";
import "package:doar_app/design/layoutcolors.dart";

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool agree = false;
  bool isLoading = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void gotoProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Inscreva-se",
                style: TextStyle(
                  color: blackUserTextColor,
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
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: blackUserTextColor,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: cyanThemeColor)),
              ),
              // Botão de entrada
              SizedBox(
                height: 15.0,
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
                        text: "Eu concordo com os Termos de ",
                        style: TextStyle(
                            color: blackFixedTextColor, fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Termos de Serviço",
                              style: TextStyle(
                                  color: cyanThemeColor, fontSize: 16.0),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TO DO: launch("https://");
                                }),
                          TextSpan(
                              text: " a e ",
                              style: TextStyle(
                                  color: blackFixedTextColor, fontSize: 16.0)),
                          TextSpan(
                              text: "Política de Privacidade",
                              style: TextStyle(
                                  color: cyanThemeColor, fontSize: 16.0),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TO DO: launch("https://");
                                }),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis, // FIXME: Possivel bug
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150, height: 50),
                child: ElevatedButton(
                  onPressed: () {
                    if (agree) {
                      registerToFb();
                    }
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(whiteBackgroundColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(cyanThemeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: cyanThemeColor)),
                    ),
                  ),
                  child: Text("Continue",
                      style: TextStyle(
                        color: whiteBackgroundColor,
                        fontSize: 22.0,
                      )),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Tem uma Conta?",
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Entrar",
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

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((UserCredential result) {
      User? user = result.user;
      if (user != null) {
        dbRef.child(user.uid).set({
          "email": emailController.text,
          "age": "vazio",
          "name": "vazio"
        }).then((result) {
          isLoading = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen(uid: user.uid)),
          );
        });
      }
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(error.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
