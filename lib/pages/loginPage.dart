import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idCt = TextEditingController();
  TextEditingController pwCt = TextEditingController();

  FocusNode idf = FocusNode();
  FocusNode pwf = FocusNode();

  @override
  void dispose() {
    this.idCt?.dispose();
    this.pwCt?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // controller: ,
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-kToolbarHeight-MediaQuery.of(context).padding.top,
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Row(),
              Container(
                width: 400.0,
                height: 400.0,
                color: Colors.indigoAccent,
              ),
              Container(
                width: 200,
                  child: TextField(
                    controller: this.idCt,
                    focusNode: this.idf,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      border: InputBorder.none,
                      hintText: "ID",
                    ),
                  ),
              ),
              Container(
                width: 200,
                  child: TextField(
                    controller: this.pwCt,
                    focusNode: this.pwf,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      border: InputBorder.none,
                      hintText: "PW"
                  ),
                ),
              ),
              TextButton(
                  onPressed: (){
                    print(this.idCt.text);
                    print(this.pwCt.text);
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
