import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/products/product_details_bloc.dart';
import 'package:khoaviettiep/entity/product.dart';
import 'package:khoaviettiep/lists_variable.dart';
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
  final TextEditingController _textEditingController = new TextEditingController();

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
      child: StreamBuilder<Product>(
        stream: ProductDetailsBloc.Instance().productStream,
        builder: (context, AsyncSnapshot snapshot) {
          Product product = snapshot.data;
          return snapshot.hasData
              ? Scaffold(
                  backgroundColor: AppTheme.colorBackgroungScaffold,
                  body: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        flexibleSpace: Image.network(linkweb + product.linkimage),
                        expandedHeight: MediaQuery.of(context).size.height / 2,
                      ),
                      _inforProduct1(product),
                      _inforProduct2(product),
                    ],
                  ),
                bottomNavigationBar: RaisedButton(child: Text("Thêm vào giỏ hàng"),),
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

  _inforProduct1(Product product) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.orangeAccent.withOpacity(0.35),
            Colors.orangeAccent.withOpacity(0.55),
            Colors.orangeAccent.withOpacity(0.25),
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                "Giá: " + (product.price != 0 ? product.price.toString() + " đ" : "Liên hệ"),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.red),
              ),
              Text(
                "Mã sản phẩm: " + product.idproduct,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "Bảo hành: " + (product.guarantee != null ? product.guarantee : "Không hỗ trợ"),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Số lượng: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ButtonTheme(
                    minWidth: 20,
                    child: OutlineButton(
                      onPressed: () {
                        _textEditingController.text = "-1";
                      },
                      splashColor: Colors.deepOrangeAccent,
                      child: Icon(Icons.remove),
                    ),
                  ),
                  StreamBuilder(
                    builder: (context, snapshotnumber) {
                      return Container(
                        width: 50,
                        child: TextField(
                          controller: _textEditingController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 18),
                              filled: true,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 1)),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 1)),
                              fillColor: Colors.white),
                        ),
                      );
                    },
                  ),
                  ButtonTheme(
                    minWidth: 20,
                    child: OutlineButton(
                      onPressed: () {
                        _textEditingController.text = "1";
                      },
                      splashColor: Colors.deepOrangeAccent,
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _inforProduct2(Product product) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Thông tin chi tiết".toUpperCase(),
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Table(
                columnWidths: {
                  0: FractionColumnWidth(0.3),
                  1: FractionColumnWidth(0.6),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Tên sản phẩm",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        product.name,
                        style: TextStyle(),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Mã sản phẩm",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        product.idproduct,
                        style: TextStyle(),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Màu sắc",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        product.color,
                        style: TextStyle(),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Bảo hành",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        product.guarantee,
                        style: TextStyle(),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Bảo hành",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        product.guarantee,
                        style: TextStyle(),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Bảo hành",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        product.guarantee,
                        style: TextStyle(),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
