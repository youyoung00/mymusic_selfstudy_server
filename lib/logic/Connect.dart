import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/mainConnectData.dart';

class Connect{

  final String END_POINT = "http://192.168.219.131:3000";

  Future<void> connect() async{
    http.Response res = await http.get(Uri.parse(this.END_POINT));
    print(res.body[0]);
    // Future<void> connect() async{
    //   http.Response res =  await http.get(Uri.parse("http://192.168.219.131:3000/"));
    //   print(res.body);
    // 서버문자열 -> 다트문법 변환: 디코드/디코딩
    // 다트문법 -> 문자열로 변환해서 서버에 전달: 인코드/인코딩
    List li = json.decode(res.body);
    print("변환: ${ li[0] +1 }");
  }

  Future<MainConnectData> mainConnect() async{
    // init 동기적인 실행
    // build 동기적인 생행
    // setState -> build 재실행 - 이미 build 한번 이상은 실행 되어있다는 전제
    // mountes - build를 했는지 체크하는 변수 / true - false

    // 예외 처리 : 정답 없음 - 발생할 수 있는 오류를 생각해야 함.
    // * Future 는 반환까지 걸리는 시간이 12~20초 정도 소요되면 내부에서 오류를 나타냄.
    // ex) 서버 주소가 잘못된 경우

    try{
      http.Response res = await http.get(Uri.parse(this.END_POINT + "/datas"))
          .timeout(Duration(seconds: 8), onTimeout: () async => http.Response("[]",404));
      // .chtchError() 함수는 http.get 에서 동작하지 않음
      List datas = json.decode(res.body);

      if(res.statusCode == 200 || res.statusCode == 301 ){
        //this.viewLoadTxt = "서버와의 연결이 지연되고 있습니다. 다시 실행해주세요";
        return new MainConnectData(data: datas.map<MainDataModel>((e) => MainDataModel.fInit(e)).toList(), viewTxt: "");

      }
      if(res.statusCode == 404) {
        // this.vData = datas.map<MainDataModel>( (e) => MainDataModel.fInit(e)).toList();
        // return ;
        return new MainConnectData(data: [], viewTxt: "서버와의 연결이 지연되고 있습니다. 다시 실행해주세요");
      }
    }
    catch(e){}
      // this.viewLoadTxt = "알수 없는 오류가 발생했습니다. 재실행하거나 고객센터로 문의주세요.";
    return new MainConnectData(data: [], viewTxt: "알수 없는 오류가 발생했습니다. 재실행하거나 고객센터로 문의주세요.");

  }
}