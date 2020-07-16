import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'package:khoaviettiep/bloc_list/homepage/appbar_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      key: _customViewKey,
      slivers: <Widget>[
        _sliverAppbar(),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Card(
            child: Text("1"),
          );
        },
          childCount: 30,
        ),
        ),
      ],
    );
  }

  Widget _sliverAppbar() {
    return SliverAppBar(
      key: _appbarKey,
      expandedHeight: 180.0,
      title: TextFormField(
        onTap: () {
          showDialog(context: context,builder: (context){
            return AboutDialog(
              applicationIcon: Icon(Icons.record_voice_over),
              applicationName: "Redirect",
              applicationVersion: "1.0.1",
              children: <Widget>[
                Text("Thích nhìn à!")
              ],
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
              icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
              onPressed: (){
                showDialog(context: context,builder: (context){
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
                  background: Swiper(
                    controller: SwiperController(),
                    duration: Duration.microsecondsPerMillisecond,
                    autoplay: true,
                    pagination: SwiperPagination(builder: SwiperPagination.dots,),
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
}
