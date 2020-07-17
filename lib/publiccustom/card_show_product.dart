import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowProduct extends StatelessWidget {
  ShowProduct({this.color=Colors.white});
  Color color;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.amber,Colors.deepOrange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.hot_tub,color: this.color,),
                      SizedBox(width: 20,),
                      Text("Khuyến mại hót".toUpperCase(),style: TextStyle(color: this.color, fontWeight: FontWeight.w700),)
                    ],
                  )
                ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.keyboard_arrow_right,color: this.color,),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
