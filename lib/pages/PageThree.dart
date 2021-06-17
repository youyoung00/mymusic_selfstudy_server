import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/SubDataModel.dart';
import 'package:http/http.dart' as thrHttp;
import 'package:mymusic1/logic/thrConnectData.dart';
import 'package:mymusic1/logic/Connect.dart';

class PageThree extends StatefulWidget {

  SubDataModel sData;
  String category;
  int index;
  int targetIndex;
  // int thrindex;
  // List<SubDataModel> thrdata;
  // String lyrics;
  //List<SubDataModel> datas;

  PageThree({@required this.sData,@required this.category,@required this.index, @required this.targetIndex});

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {

  thrConnectData detailViewData;

  @override
  void initState() {
    Future(() async{
      this.detailViewData = await new Connect().detailConnect(index: widget.index, targetIndex: widget.targetIndex );
      print(this.detailViewData);
      if(!mounted) return;
      setState(() {});
    });
    super.initState();
  }

  // SubDataModel thrviewData;
  //
  // Future<void> thrConnect() async{
  //   thrHttp.Response res = await thrHttp.get(Uri.parse("http://192.168.86.33:3000/thrdata/${widget.thrindex}"));
  //  Map<String, dynamic> thrdata = json.decode(res.body);
  //  this.thrviewData = SubDataModel.fInit(thrdata);
  //  print(thrviewData.lyrics);
  //  return;
  // }

// @override
//   void initState() {
//        new Future(() async{
//             await this.thrConnect();
//             if(!mounted) return;
//             setState(() {});
//           });
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.category),
        centerTitle: true
      ),
      body: this._checkWidget(detailViewData)
    );
  }
  Widget _checkWidget(thrConnectData detailViewData){
    if(detailViewData == null) return (Center(child: Text("로딩 중입니다"),));
    if(detailViewData.check == thrConnectCheck.ERROR) return (Center(child: Text("오류 발생"),));
    if(detailViewData.check == thrConnectCheck.TIMEOUT) return (Center(child: Text("서버 연결이 지연되고 있습니다..."),));
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Title(
                  child: Text(this.detailViewData.subDataModel.title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(this.detailViewData.subDataModel.artist),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
                width: 500,
                height: 500,
                child: Image(
                  image: NetworkImage(
                      this.detailViewData.subDataModel.jacket
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                      this.detailViewData.subDataModel.lyrics)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
