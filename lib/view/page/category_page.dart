import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/call_api_viettiep/api_catergory.dart';
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
    ProductApi.Instance().getCategoryListTitle();
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
            child: FutureBuilder(
              future: ProductApi.Instance().getCategoryListTitle(),
              builder: (context,AsyncSnapshot<String> snapshot){
                print(snapshot);
                return  snapshot.hasData?
                 ListView.builder(itemBuilder: (context,index){
                  return InkWell(
                    focusColor: Colors.red,
                    highlightColor: Colors.green,
                    onTap: (){
                      FlutterToast(context).showToast(child: Text("Show here!"));
                    },
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Image.network("http://khoaviettiep.com.vn/upload/Image/sanpham/khoa-dien-tu/28384/3.png}"),
                            Text("Text")
                          ],
                        )
                    ),
                  )
                  ;
                },
                  itemCount: snapshot.data.length,):Container(child: Text("Không có dữ liệu"),);
              },
            ),
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
