import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State with TickerProviderStateMixin {

  Key keyCategory = new Key('Cate');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: Text("")
    );
//    return Column(
//      children: <Widget>[
//
//        Container(
//          child: Transform.scale(
//            key: keyCategory,
//            scale: 10.0,
//            origin: Offset(animation.value, animation.value),
//            transformHitTests: true,
//            child: Icon(Icons.shop),
//          ),
//        ),
//      ],
//    );
  }
}
