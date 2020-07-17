import 'package:flutter/cupertino.dart';

class ShowProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/images/banner3.png"),
            )
          ),
          child:           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("1"),
              Text("1"),
            ],
          ),

        )
      ],
    );
  }



}