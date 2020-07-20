import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalPageState();
  }

}
class _PersonalPageState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cá Nhân"),
      ),
      body: Center(
        child: Text("Personal page"),
      ),
    );
  }

}