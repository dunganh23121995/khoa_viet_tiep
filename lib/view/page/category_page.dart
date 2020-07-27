import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/categorypage/caption_bloc.dart';
import 'package:khoaviettiep/bloc_list/products/products_bloc.dart';
import 'package:khoaviettiep/view/products.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State with TickerProviderStateMixin {
  Key keyCategory = new Key('Cate');
  CaptionBloc _captionBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _captionBloc = new CaptionBloc();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Danh mục sản phẩm",style: TextStyle(
          color: AppTheme.colorTextAppbar
        ),),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: _showCaption(),
          ),
          Expanded(flex: 8, child: Center(child: _showMenu()))
        ],
      ),
    );
  }

  Widget _showCaption() {
    return StreamBuilder(
      stream: _captionBloc.captionStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: Colors.grey.withAlpha(200),
                  ),
                  itemBuilder: (context, index) {
                    String linkimage;
                    if (snapshot.data[index]['anhdaidien'] == null) {
                      linkimage = "http://khoaviettiep.com.vn/upload/product_imgs/2020/4/1747/4051632%20(1).png";
                    } else {
                      linkimage = "http://khoaviettiep.com.vn/${snapshot.data[index]['anhdaidien']}";
                    }
                    return StreamBuilder(
                      stream: _captionBloc.indexStream,
                      builder: (context, snapshotIndex) {
                        return Container(
                          margin: EdgeInsets.zero,
                          decoration: snapshotIndex.data == index
                              ? BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(color: AppTheme.colorAppbar, style: BorderStyle.solid, width: 2),
                                  ))
                              : BoxDecoration(color: Colors.white),
                          padding: EdgeInsets.only(
                              bottom: index == snapshot.data.length - 1 ? MediaQuery.of(context).size.height / 12 : 0),
                          child: Container(
                            child: OutlineButton(
                              padding: EdgeInsets.all(15.0),
                              highlightColor: Colors.white,
                              splashColor: Colors.white,
                              onPressed: () {
                                _captionBloc.onClickCaption(index: index);
                              },
                              child: Container(
                                  height: MediaQuery.of(context).size.height / 8,
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: Image(
                                          image: NetworkImage(linkimage),
                                        ),
                                        fit: FlexFit.loose,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Wrap(children: <Widget>[
                                          Text(
                                            snapshot.data[index]['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: snapshotIndex.data == index ? Colors.orange : Colors.grey),
                                            maxLines: 2,
                                          ),
                                        ]),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              )
            : Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height / 8,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballSpinFadeLoader,
                      ),
                    ));
                  },
                  itemCount: 10,
                ),
              );
      },
    );
  }

  Widget _showMenu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child:
                Image.network("http://khoaviettiep.com.vn/upload/Image/slideshow/banner-45nam-bo3khoa-trungchia.jpg",
                fit: BoxFit.fitHeight,),
          ),
          Flexible(
            flex: 1,
            child: StreamBuilder(
              stream: _captionBloc.indexStream,
              builder: (context, indexSnapshot){
                return indexSnapshot.hasData&&_captionBloc.listcaption.length!=0?
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("${_captionBloc.listcaption[indexSnapshot.data]['title']}".toUpperCase(),style:
                        TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.colorTextTitle
                        ),),
                      ),
                    ):
                Container(
                );
              },
            ),
          ),
          Flexible(
            flex: 8,
            child: StreamBuilder(
              stream: _captionBloc.menuStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.separated(
                        separatorBuilder: (context, index) => Divider(height: 0,),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsShow()));
                                ProductsBloc.Instance().getProductsWithId(idmenu: snapshot.data[index]['id']);
                              },
                              dense: true,
                              title: Text("${snapshot.data[index]['title']}"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          );
                        },
                        itemCount: snapshot.data.length)
                    : Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
