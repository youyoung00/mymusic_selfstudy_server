import 'package:flutter/material.dart';
import 'package:mymusic1/Models/SubDataModel.dart';

class PageThree extends StatelessWidget {

  SubDataModel sData;
  String category;

  PageThree({@required this.sData,@required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.category),
        centerTitle: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: Title(
                    child: Text(this.sData.title,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(this.sData.artist
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
                  width: 500,
                  height: 500,
                  child: Image(
                    image: NetworkImage(this.sData.jacket),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(this.sData.lyrics)
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
