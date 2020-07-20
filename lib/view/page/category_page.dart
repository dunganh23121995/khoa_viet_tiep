import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoaviettiep/publiccustom/card_a_product.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State with TickerProviderStateMixin {

  Key keyCategory = new Key('Cate');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ListView.builder(itemBuilder: (context,index){
              return Container(
                child: Tab(
                  icon: Image.asset("assets/images/01504-copy.png"),
                  child: Text("Why"),
                ),
                height: 120,
              )
              ;
            },
            itemCount: 5,),
          ),
          Expanded(
            flex: 8,
            child:Center(
              child:  Text("List danh sach"),
            ),
          )
        ],
      ),
    );
  }
}
