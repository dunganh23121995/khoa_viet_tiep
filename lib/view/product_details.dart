import 'package:flutter/material.dart';
import 'package:khoaviettiep/bloc_list/products/product_details_bloc.dart';
import 'package:khoaviettiep/bloc_list/products/products_bloc.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    widget.idproduct != null ? ProductDetailsBloc.Instance().getProductDetails(idproduct: widget.idproduct) : {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Hero(
      tag: 'productdetails${widget.idproduct}',
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                color: Colors.white,
                child: Text("Chi tiet hoa don"),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
