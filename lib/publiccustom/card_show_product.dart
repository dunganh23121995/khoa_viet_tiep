import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';

class ShowProduct extends StatelessWidget {
  ShowProduct({this.color = Colors.white});
  String title;
  Widget textaction,iconaction;

  Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        //Title
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.amber, Colors.deepOrange],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          // Đây là tiêu đề của nhóm sản phẩm // This is title of group product
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.hot_tub,
                      color: this.color,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Khuyến mại hót".toUpperCase(),
                      style: TextStyle(color: this.color, fontWeight: FontWeight.w700),
                    )
                  ],
                )),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        FlutterToast(context).showToast(child: Text("Oh my god"));
                      },
                      child: ButtonBar(
                        children: <Widget>[
                          Text(
                            "Xem thêm",
                            style: TextStyle(color: AppTheme.colorTextTitle),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //row product 1
        Container(
          width: double.infinity,
          child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CardProduct(),
                CardProduct(),
                CardProduct(),
                CardProduct(),
                CardProduct(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
