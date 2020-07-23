import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/categorypage/caption_bloc.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

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
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: _showMenuCaption(),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: Image.network(
                  "https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg"),
            ),
          )
        ],
      ),
    );
  }

  Widget _showMenuCaption() {
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
                                FlutterToast(context).showToast(child: Text("Show here!"));
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
                      child: Loading(indicator: new BallSpinFadeLoaderIndicator(), color: Colors.orange.withAlpha(50)),
                    ));
                  },
                  itemCount: 10,
                ),
              );
      },
    );
  }
}
