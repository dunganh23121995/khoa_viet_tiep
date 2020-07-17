import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }

}
class _CategoryPageState extends State  with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;
  Key keyCategory = new Key('Cate');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync: this,duration: Duration(seconds: 3))
    ..addListener(() {
      setState(() {

      });
    });
    animation = Tween(begin: -10.0,end: 50.0).animate(controller);
    controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Transform.scale(
          key: keyCategory,
          scale: 10.0,
          origin: Offset(animation.value,animation.value),
        transformHitTests: true,
        child: Icon(Icons.shop),)

    );
  }

}