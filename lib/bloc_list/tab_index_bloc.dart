import 'package:flutter/cupertino.dart';
import 'package:khoaviettiep/view/page/category_page.dart';
import 'package:khoaviettiep/view/page/home_page.dart';
import 'package:khoaviettiep/view/page/notification_page.dart';
import 'package:khoaviettiep/view/page/personal_page.dart';
import 'package:khoaviettiep/view/page/qrcode_barcode_screen.dart';
import 'package:rxdart/rxdart.dart';

class TabindexBloc{
      BehaviorSubject<Widget> _subjectPage;
      BehaviorSubject<int> _subjectIndex;
      Stream<Widget> get observablePage => _subjectPage.stream;
      Stream<int> get observableIndex => _subjectIndex.stream;

      TabindexBloc(){
            _subjectPage = new BehaviorSubject<Widget>.seeded(new HomePage());
            _subjectIndex = new BehaviorSubject<int>.seeded(0);
      }

      void openHomePage(){
            _subjectPage.sink.add(new HomePage());
            _subjectIndex.sink.add(0);
      }
      void openCategoryPage(){
            _subjectPage.sink.add(new CategoryPage());
            _subjectIndex.sink.add(1);

      }
      void openNotificationPage(){
            _subjectPage.sink.add(new NotificationPage());
            _subjectIndex.sink.add(3);
      }
      void openQRBarcodePagePage(){
            _subjectPage.sink.add(new QRBarcodePage());
            _subjectIndex.sink.add(2);

      }
      void openPersonalPage(){
            _subjectPage.sink.add(new PersonalPage());
            _subjectIndex.sink.add(4);
      }
      void dispose(){
            _subjectPage.close();
            _subjectIndex.close();
      }
}