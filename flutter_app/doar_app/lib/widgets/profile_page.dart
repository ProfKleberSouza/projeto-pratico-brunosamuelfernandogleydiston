import 'package:doar_app/widgets/dashboard_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Profile>
  with SingleTickerProviderStateMixin {
  bool boolean = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25.0, 
                      right: 25.0, 
                      top: 25.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            boolean ? getEditIcon() : new Container(),
                          ],
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Stack(
                      fit: StackFit.loose, 
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/images/user.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: const Color(0xff63dadb),
                                radius: 25.0,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.0, 
                            right: 25.0, 
                            top: 25.0
                          ),
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              hintText: "Seu Nome",
                                            ),
                                            enabled: !boolean,
                                            autofocus: !boolean,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30.0,
                            horizontal: 16.0
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Quem eu sou?",
                                style: TextStyle(
                                  color: const Color(0xff63dadb),
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Bio"
                                        ),
                                        enabled: !boolean,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  !boolean ? getActionButtons() : new Container(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 180, height: 80),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
              },
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff63dadb)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: const Color(0xff63dadb)),
                  ),
                ),
              ),
              child: Text(
                'Doações',
                style: TextStyle(color: Colors.white, fontSize: 22.0)
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.0, 
        right: 25.0, 
        top: 45.0
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      boolean = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  child: Text('Salvar',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      boolean = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  child: Text('Cancelar',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: const Color(0xff63dadb),
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          boolean = false;
        });
      },
    );
  }
}
