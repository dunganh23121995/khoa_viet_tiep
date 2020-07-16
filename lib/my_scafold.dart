import 'package:flutter/cupertino.dart';

class MyScafold extends StatefulWidget{
  Widget body,appbar;
  MyScafold({this.appbar,this.body});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyScafoldState();
  }

}
class MyScafoldState extends State<MyScafold>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned(
          child: Column(
            children: <Widget>[
              widget.appbar==null?Container(): widget.appbar,
              widget.body==null?Container():widget.body,
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: widget.appbar==null?Container(): widget.appbar,
        )
      ],
    );
  }

}