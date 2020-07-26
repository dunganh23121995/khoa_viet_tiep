import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoaviettiep/bloc_list/products/products_bloc.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';
import 'package:khoaviettiep/publiccustom/card_show_product.dart';

class ProductsShow extends StatefulWidget {
  ProductsShow({this.idmenu = 195});

  int idmenu;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsShow();
  }
}

class _ProductsShow extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
          stream: ProductsBloc.Instance().productsStream,
          builder: (context, snapshot) {
            print(snapshot.data);
            return snapshot.hasData
                ? GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        child: CardProduct(
                          image: Image.network('${linkweb}${snapshot.data[index]['anhdaidien']}'),
                          name: snapshot.data[index]['title'],
                          price: int.parse(snapshot.data[index]['giaban']),
                          cost: int.parse(snapshot.data[index]['giathitruong']),
                        ),
                      );
                    })
                : Container();
          },
        ));
  }
}
