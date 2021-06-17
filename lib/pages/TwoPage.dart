import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/SubDataModel.dart';
import 'package:mymusic1/logic/subConnectData.dart';
import 'package:mymusic1/pages/PageThree.dart';
import 'package:http/http.dart' as HTTP;
import 'package:mymusic1/logic/Connect.dart';

class TwoPage extends StatefulWidget {

  String category;
  String categoryimg;
  List<SubDataModel> datas;
  int index;

  //String lyrics;
  TwoPage({@required this.category, @required this.datas, @required this.categoryimg, @required this.index});

  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {

  SubConnectData viewData;
  String viewLoadTxt = "로딩 중.....";

  @override
  void initState() {
    Future(() async{
      this.viewData = await new Connect().subConnect(index: widget.index);
      if(!mounted) return;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.category),
        centerTitle: true,
      ),
      body: this._checkWidget(viewData)
    );
  }

  Widget _checkWidget(SubConnectData viewData){
    if(viewData == null) return Container(child: Center(child: Text("Load..."),),);
    if(viewData.check == SubConnectCheck.Error) return Center(child: Text("오류발생"),);
    if(viewData.check == SubConnectCheck.ServerTimeOut) return Center(child: Text("서버 지연 발생"),);
    return ListView.builder(
      // itemCount: this.widget.datas.length,
        itemCount: this.viewData.mainDataModel.datas.length,
        itemBuilder: (BuildContext context, int index){
          return new ListTile(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context){
                    return new PageThree(
                      index: widget.index,
                      targetIndex: index,
                      sData: this.widget.datas[index],
                      category: this.widget.category,
                    );
                  }
                )
              );
              return;
            },
            leading: Container(width: 40.0, height: 50.0,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(this.widget.datas[index].jacket
                ),
              ),
            ),
            // title: Container(
            //   child: Text(this.widget.datas[index].title
            //   ),
            // ),
            title: Text(this.viewData.mainDataModel.datas[index].title),
            subtitle: Container(
              child: Text(this.widget.datas[index].artist
              ),
            ),
            trailing: Icon(Icons.play_circle_fill),
          );
      }
    );
  }
}
