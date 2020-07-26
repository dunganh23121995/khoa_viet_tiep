import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardProduct extends StatelessWidget {
  Image image;
  GestureTapCallback ontap;
  int price, cost;
  String name;

  CardProduct({this.image, this.name = "Tên sản phẩm", this.price = 0, this.cost = 0, this.ontap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(2.0),
      color: Colors.white,
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            image != null ?
            Flexible(
              flex: 1,
              child: Container(
                child: image,
              ),
            )
                : Container(),
            Text(
              name,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              NumberFormat.currency(customPattern: '#,##0').format(price).replaceAll('.00', " VNĐ"),
              maxLines: 1,
            ),
            Text(
              NumberFormat.currency(customPattern: '#,##0').format(cost).replaceAll('.00', " VNĐ"),
              style: TextStyle(
                decoration: TextDecoration.lineThrough
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
