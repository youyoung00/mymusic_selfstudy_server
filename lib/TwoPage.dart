import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/SubDataModel.dart';
import 'package:mymusic1/PageThree.dart';
import 'package:http/http.dart' as HTTP;


class TwoPage extends StatefulWidget {

  String category;
  String categoryimg;
  List<SubDataModel> datas;
  int index;
  TwoPage({
    @required this.category,
    @required this.datas,
    @required this.categoryimg,
    @required this.index
  });

  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {

  MainDataModel viewData;

  Future<void> subConnect() async{
    HTTP.Response res = await HTTP.get(Uri.parse("http://192.168.219.131:3000/data/${widget.index}"));
    Map<String,dynamic> data = json.decode(res.body);
    this.viewData = MainDataModel.fInit(data);
    print(viewData.category);
    return;
  }

  @override
  void initState() {
    Future(() async{
      await this.subConnect();
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
      body: this.viewData == null
          ? Container(child: Center(child: Text("Load...."),),)
          : ListView.builder(
        // itemCount: this.widget.datas.length,
          itemCount: this.viewData.datas.length,
          itemBuilder: (BuildContext context, int index){
          return new ListTile(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context){
                  return new PageThree(
                      sData: this.widget.datas[index],
                    category: this.widget.category,
                  );
                }
              ));
              return;
            },
            leading: Container(
              width: 40.0,
              height: 50.0,
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
            title: Text(this.viewData.datas[index].title),
            subtitle: Container(
              child: Text(this.widget.datas[index].artist
              ),
            ),
            trailing: Icon(Icons.play_circle_fill),
          );
        }
      ),
    );
  }
}
