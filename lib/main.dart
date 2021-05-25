import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/SubDataModel.dart';
import 'package:mymusic1/Models/mainConnectData.dart';
import 'package:mymusic1/TwoPage.dart';
import 'package:http/http.dart' as http;
import 'package:mymusic1/logic/Connect.dart';

void main(){runApp(new App());}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List <MainDataModel> vData;
  String viewLoadTxt = "로딩 중.....";
  Connect connect = new Connect();

  @override
  void initState() {

    Future(() async{
      MainConnectData data = await this.connect.mainConnect();
      this.vData = data.data;
      this.viewLoadTxt = data.viewTxt;
      if(!mounted) return;
      setState(() {});
    });

    new Future(this.connect.connect);
    this.connect.connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("My Music"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add_outlined),
            onPressed: (){
              return;
            },
          )
        ],
      ),
      body: this.vData == null
          ? Center(child: Text(this.viewLoadTxt),)
          : new GridView.builder(
        padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: this.vData.length,
          itemBuilder: (BuildContext context, int i){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context){
                    return new TwoPage(
                      index: i,
                      category: this.vData[i].category,
                      datas: this.vData[i].datas,
                      categoryimg: this.vData[i].categoryimg
                    );
                  })
                );
                return;
              },
              child: new Container(
                width: 60.0,
                height: 60.0,
                color: Colors.black12,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(right: 5.0),
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.amberAccent,
                      child: Icon(
                          Icons.playlist_add_check,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:10.0, bottom: 10.0),
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(this.vData[i].categoryimg),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Container(
                      child: Title(
                        color: Colors.black,
                        child: Text(this.vData[i].category,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.play_arrow_sharp),
                          Icon(Icons.settings),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
