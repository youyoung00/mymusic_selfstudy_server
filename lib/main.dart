import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/SubDataModel.dart';
import 'package:mymusic1/Providers/mainProvider.dart';
import 'package:mymusic1/exProvider/ex2Provider.dart';
import 'package:mymusic1/exProvider/ex3Provider.dart';
import 'package:mymusic1/exProvider/exProvider.dart';
import 'package:mymusic1/exProvider/exView.dart';
import 'package:mymusic1/logic/mainConnectData.dart';
import 'package:mymusic1/pages/TwoPage.dart';
import 'package:http/http.dart' as http;
import 'package:mymusic1/logic/Connect.dart';
import 'package:mymusic1/pages/loginPage.dart';
import 'package:provider/provider.dart';

void main(){runApp(new App());}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExProvider>(
            create: (_) => new ExProvider(),
        ),
        ChangeNotifierProvider<Ex2Provider>(
            create: (_) => new Ex2Provider()
        ),
        ChangeNotifierProvider<MainProvider>(
          create: (_) => new MainProvider()
        )
      ],
      child: new MaterialApp(
                //home: MainPage(),
        // home: MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider<Ex2Provider>(
        //         create: (_) => new Ex2Provider()
        //     )
        //   ],
        home: LoginPage(),
      ),
    );
  }
}

class MainPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: this.items(provider.data)
    );
  }

  Widget items(MainConnectData data){
    if(data == null) return Container(
      child: Center(child: Text("Load..."),),
    );
    // if(data.data.length == 0)
    if(data.data.isEmpty) return Container(
      child: Center(child: Text("서버 연결의 오류가 발생했습니다."),),
    );
    //if(data.viewTxt == "서버와의 연결이 지연되고 있습니다 다시 실행 해주세요");
    return Container(
      child: GridView.builder(
        itemCount: data.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) => Container(
          child: Text(data.data[index].category),
        ),
      ),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List <MainDataModel> data;
  String viewLoadTxt = "로딩 중.....";
  //Connect connect = new Connect();
  MainConnectData vData;
  int index;
  //MainConnectData mainConnectData;

  @override
  void initState() {
    Future(() async{
      //MainConnectData connect =
      this.vData = await Connect().mainConnect(data);
      if(!mounted) return;
      setState(() {});
    });
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
      body: this._checkWidget(vData)
    );
  }

  Widget _checkWidget(MainConnectData vData){
    if(vData == null) return Center(child: Text("Loading........."),);
    if(vData.check == MainConnectCheck.ServerTimeOut) return Center(child: Text("서버와의 연결이 지연되고 있습니다. 고객센터에 문의하세요."),);
    if(vData.check == MainConnectCheck.Error) return Center(child: Text("오류가 발생하였습니다......"),);
    return new GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: this.vData.data.length,
      itemBuilder: (BuildContext context, int i){
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context){
                  return new TwoPage(
                      index: i,
                      category: this.vData.data[i].category,//this.vData[i].category,
                      datas: this.vData.data[i].datas,
                      categoryimg: this.vData.data[i].categoryimg
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
                          image: NetworkImage(this.vData.data[i].categoryimg),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  child: Title(
                    color: Colors.black,
                    child: Text(this.vData.data[i].category,
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
    );
  }
}
