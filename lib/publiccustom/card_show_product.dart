import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/homepage/body_bloc.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';
import 'package:khoaviettiep/view/products.dart';

class ShowProduct extends StatelessWidget {
  ShowProduct({this.color = Colors.white});

  String title;
  Widget textaction, iconaction;
  Gradient gradient;
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
                      "Khuyến mại hot".toUpperCase(),
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
                            style: TextStyle(color: Colors.white),
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

        //row product 1 do không dùng được listview để wrap text horizontal scroll nên dùng single child scrollview
        // với block là các widget. Xử lý luồng bloc là các child view
        Container(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
            stream: BodyHomeBloc.Instance().cardProductStream,
            builder: (context, snapshot) {
              List<Widget> list = new List();
              if (snapshot.hasData) {
                List products = snapshot.data;
                products.forEach((product) {
                  list.add(Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: AppTheme.colorOrange,
                        )
                      )
                    ),
                    child: Container(
                      height: 150,
                      width: 120,
                      child: CardProduct(
                        width: double.infinity,
                        ishot: true,
                        image: Image.network(linkweb + '/' + product['anhdaidien']),
                        name: product['title'],
                        price: int.parse(product['giaban']),
                      ),
                    ),
                  ));
                });
              }
              return Row(children: list);
            },
          ),
        )),
      ],
    );
  }
}
