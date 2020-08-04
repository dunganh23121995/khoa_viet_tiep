import 'package:flutter/material.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/products/product_details_bloc.dart';
import 'package:khoaviettiep/bloc_list/products/products_bloc.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({@required this.idproduct});

  int idproduct;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductDetails();
  }
}

class _ProductDetails extends State<ProductDetails> {
  final Key _appbarProduct = Key("appbarproduct");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.idproduct != null ? ProductDetailsBloc.Instance().getProductDetails(idproduct: widget.idproduct) : {};
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Hero(
      tag: 'productdetails${widget.idproduct}',
      child: StreamBuilder(
        stream: ProductDetailsBloc.Instance().productStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  body: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        flexibleSpace: Image.network(linkweb + snapshot.data['anhdaidien']),
                        expandedHeight: MediaQuery.of(context).size.height / 2,
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange.withOpacity(0.15),Colors.orangeAccent.withOpacity(0.55),
                                Colors.orange.withOpacity(0.75)]
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                snapshot.data['title'],
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                              Text("Giá: "+
                                  (snapshot.data['giaban']!='0'?
                                snapshot.data['giaban']+" đ":"Liên hệ"),
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.red),
                              ),
                              Text(
                                "Bảo hành: " +
                                    (snapshot.data['baohanh'] != null
                                        ? snapshot.data['baohanh'].toString()
                                        : "Không hỗ trợ"),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Số lượng: ",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(<Widget>[Text("Here")]),
                      ),
                    ],
                  ),
                )
              : Scaffold(
                  appBar: AppBar(),
                  body: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,
                    colors: <Color>[Colors.orangeAccent, Colors.deepOrange, Colors.green],
                  ),
                );
        },
      ),
    );
  }
}
