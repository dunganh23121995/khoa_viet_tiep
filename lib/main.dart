import 'package:flutter/material.dart';
import 'package:khoaviettiep/AppTheme.dart';
import 'dart:ui' as ui;

import 'package:khoaviettiep/curved_navigation_bar_custom.dart';
import 'package:khoaviettiep/view/page/home_page.dart';
import 'bloc_list/tab_index_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  int tabindex = 0;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabindexBloc _tabindexBloc = new TabindexBloc();
  final Key _curvelNavigationBarKey = new Key("curvelnavigationbarkey");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          StreamBuilder(
            stream: _tabindexBloc.observablePage,
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              return Container(
                child: snapshot.hasData ? snapshot.data : Container(),
              );
            },
          ),
          _bottomNavigtionbar(
              Icon(Icons.home),
              "Trang chủ",
              Icon(Icons.category),
              "Danh mục",
              Icon(Icons.scanner),
              "Mã",
              Icon(Icons.notifications_none),
              "Thông báo",
              Icon(Icons.perm_identity),
              "Cá nhân",
            ),
        ],
      ),
    );
  }

  Widget _bottomNavigtionbar(
    Icon icon1,
    String title1,
    Icon icon2,
    String title2,
    Icon icon3,
    String title3,
    Icon icon4,
    String title4,
    Icon icon5,
    String title5,
  ) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: StreamBuilder(
            stream: _tabindexBloc.observableIndex,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return snapshot.hasData
                  ? CurvedNavigationBarCustom(
                      key: _curvelNavigationBarKey,
                      backgroundColor: Colors.transparent,
                      buttonBackgroundColor: Colors.orange,
                      color: AppTheme.colorbottomNavbar,
                      animationDuration: Duration(milliseconds: 200),
                      index: snapshot.data,
                      height: 58,
                      items: <Widget>[
                        Icon(icon1.icon, size: 30, color: snapshot.data == 0 ? Colors.white : Colors.grey),
                        Icon(icon2.icon, size: 30, color: snapshot.data == 1 ? Colors.white : Colors.grey),
                        Icon(icon3.icon, size: 30, color: snapshot.data == 2 ? Colors.white : Colors.grey),
                        Icon(icon4.icon, size: 30, color: snapshot.data == 3 ? Colors.white : Colors.grey),
                        Icon(icon5.icon, size: 30, color: snapshot.data == 4 ? Colors.white : Colors.grey),
                      ],
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            _tabindexBloc.openHomePage();
                            break;
                          case 1:
                            _tabindexBloc.openCategoryPage();
                            break;
                          case 2:
                            _tabindexBloc.openQRBarcodePagePage();
                            break;
                          case 3:
                            _tabindexBloc.openNotificationPage();
                            break;
                          case 4:
                            _tabindexBloc.openPersonalPage();
                            break;
                        }
                      },
                    )
                  : Container();
            },
          ),
        ),
        Table(
          children: <TableRow>[
            TableRow(children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  title1,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title2,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title3,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title4,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title5,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ])
          ],
        )
      ],
    );
  }
}
