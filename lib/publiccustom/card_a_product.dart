import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget{

  Image image;
  GestureTapCallback ontap;
  Widget nameproduct;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: ontap,
      child: Column(
        children: <Widget>[
          Flexible(
              flex: 4,
              child: image
          ),
          Flexible(
            flex: 2,
            child: nameproduct,
          ),
          Flexible(
            flex: 1,
            child: Text(12321.toStringAsFixed(3)),
          ),
          Flexible(
            flex: 1,
          )
        ],
      ),
    );
  }

}