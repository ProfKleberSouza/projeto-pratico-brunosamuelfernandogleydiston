import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doar_app/pages/login_page.dart';
import 'package:doar_app/pages/chathome_page.dart';
import 'package:doar_app/mixin/palette_colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({this.uid});
  final String? uid;
  final String title = 'Perfil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: whiteBackgroundColor,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Minha conta')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), title: Text('Meus pedidos')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favoritos')),
        ],
      ),
      backgroundColor: whiteBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: ExactAssetImage(
                                  'assets/images/user.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Bruno Kelsen',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Belo Horizonte, MG',
                          style: TextStyle(
                            color: lightgreyBackgroundColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Flexible(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText:
                                'Sou assistente social e o ato de doar para mim é \n contribuir efetivamente com a transformação para o \n melhor da sociedade, das instituições e, \n principalmente das pessoas.',
                          ),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: blackUserTextColor,
                            letterSpacing: 2.0,
                          ),
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 300.00,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatHomeScreen()));
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
                    elevation: MaterialStateProperty.all<double>(0.0),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(0.0)),
                  ),
                  child: Text('Chat',
                      style: TextStyle(
                          color: whiteBackgroundColor, fontSize: 22.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
