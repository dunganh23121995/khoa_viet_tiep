import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsShow extends StatefulWidget{
  ProductsShow({this.idmenu=195});
  int idmenu;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _ProductsShow();
  }

}
class _ProductsShow extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        builder: (context,snapshot){
          return Container();
        },
      )
    );
  }
}