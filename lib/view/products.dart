import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/products/products_bloc.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';
import 'package:khoaviettiep/publiccustom/card_show_product.dart';
import 'package:khoaviettiep/view/product_details.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
    return Material(
      child: Scaffold(
          appBar: AppBar(),
          body: StreamBuilder(
            stream: ProductsBloc.Instance().productsStream,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Hero(
                            tag: 'productdetails${index}',
                            child: CardProduct(
                              ontap: (){
                                Navigator.of(context).push(MaterialPageRoute<void>(builder: (context)=>ProductDetails
                                  (idproduct: int.parse(snapshot.data[index]['id']),)));
                              },
                              width: double.infinity,
                              ishot: snapshot.data[index]['ishot']=="true",
                              isnew:snapshot.data[index]['updated']!=null?(DateTime.now().subtract(Duration(days: 365*2))).isBefore(DateTime.parse(snapshot.data[index]['updated'])):false,
                              image: Image.network('${linkweb}${snapshot.data[index]['anhdaidien']}',fit: BoxFit.fitWidth,),
                              name: snapshot.data[index]['title'],
                              price: int.parse(snapshot.data[index]['giaban']),
                              cost: int.parse(snapshot.data[index]['giathitruong']),
                            ),
                          ),
                        );
                      })
                  : LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                color: AppTheme.colorOrange,
              );
            },
          )),
    );
  }
}
