import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/homepage/appbar_bloc.dart';
import 'package:khoaviettiep/publiccustom/button_custom.dart';
import 'package:khoaviettiep/publiccustom/card_show_product.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State {
  final Key _appbarKey = new Key("appbar");
  final Key _customViewKey = new Key("customviewkey");
  List<String> _listurlImage = new List();
  final AppBarHomeBloc _appBarHomeBloc = new AppBarHomeBloc();
  double width = 60, height = 60;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      key: _customViewKey,
      slivers: <Widget>[_sliverAppbar(), _sliverNav(), _sliverBody()],
    );
  }

  Widget _sliverAppbar() {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))),
      key: _appbarKey,
      expandedHeight: 180.0,
      title: TextFormField(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AboutDialog(
                  applicationIcon: Icon(Icons.record_voice_over),
                  applicationName: "Redirect",
                  applicationVersion: "1.0.1",
                  children: <Widget>[Text("Thích nhìn à!")],
                );
              });
        },
        readOnly: true,
        autofocus: true,
        decoration: InputDecoration(
          focusColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.colorItemOnSearch,
          ),
          hintText: "Tìm kiếm sản phẩm...",
          filled: true,
          fillColor: Colors.white,
          suffixText: "Miền Bắc",
          suffixIcon: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    Navigator.pop(context);
                    return AboutDialog(
                      applicationIcon: Icon(Icons.print),
                      applicationName: "Đổi Miền",
                    );
                  });
            },
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35,
          ),
        )
      ],
      pinned: true,
      flexibleSpace: StreamBuilder(
        stream: _appBarHomeBloc.listUrlImageStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) _listurlImage = snapshot.data;
          return _listurlImage.length > 0
              ? FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Swiper(
                    controller: SwiperController(),
                    duration: Duration.microsecondsPerMillisecond,
                    autoplay: true,
                    pagination: SwiperPagination(
                      builder: SwiperPagination.dots,
                    ),
                    itemCount: _listurlImage.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _listurlImage[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                )
              : Container();
        },
      ),
    );
  }
  Widget _sliverNav() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleTitleButton(
              das: 4,
              colorbutton: Colors.yellow,
              ontap: () {
                setState(() {

                });
                FlutterToast(context).showToast(child: Text("Ok men"));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.repeat,
                  size: 30,
                ),
              ),
              title: Text(
                "Button",
                style: TextStyle(),
              ),
              notification: Text(
                "1",
                style: TextStyle(color: Colors.red),
              ),
            ),
            CircleTitleButton(
              das: 4,
              colorbutton: Colors.yellow,
              ontap: () {
                FlutterToast(context).showToast(child: Text("Ok men"));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.repeat,
                  size: 30,
                ),
              ),
              title: Text(
                "Button",
                style: TextStyle(),
              ),
              notification: Text(
                "1",
                style: TextStyle(color: Colors.red),
              ),
            ),
            CircleTitleButton(
              das: 4,
              colorbutton: Colors.yellow,
              ontap: () {
                FlutterToast(context).showToast(child: Text("Ok men"));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.repeat,
                  size: 30,
                ),
              ),
              title: Text(
                "Button",
                style: TextStyle(),
              ),
              notification: Text(
                "1",
                style: TextStyle(color: Colors.red),
              ),
            ),
            CircleTitleButton(
              das: 4,
              colorbutton: Colors.yellow,
              ontap: () {
                FlutterToast(context).showToast(child: Text("Ok men"));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.repeat,
                  size: 30,
                ),
              ),
              title: Text(
                "Button",
                style: TextStyle(),
              ),
              notification: Text(
                "1",
                style: TextStyle(color: Colors.red),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _sliverBody() {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
            ShowProduct()
      ]),
    );
  }
}
