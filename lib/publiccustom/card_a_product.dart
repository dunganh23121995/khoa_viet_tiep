import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardProduct extends StatelessWidget{

  Image image;
  GestureTapCallback ontap;
  Widget nameproduct;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                flex: 4,
                child: Container(
                    child: Image.asset("assets/images/01504-copy.png"),
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                )
            ),
            Flexible(
              flex: 2,
              child: Text("Tên sản phẩm"),
            ),
            Flexible(
              flex: 1,
              child: Text(NumberFormat.currency(customPattern: '#,###.#').format(123456789.0)),
            ),
            Flexible(
              flex: 1,
              child: Text("Giá gốc"),
            )
          ],
        ),
      ),
    );
  }

}