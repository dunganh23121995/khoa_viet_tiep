import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class AppBarHomeBloc {
  final List<String> _listUrlImage = new List();
  BehaviorSubject<List<String>> _subjectUrlImage;

  Stream get listUrlImageStream => _subjectUrlImage.stream;

  AppBarHomeBloc() {
    _subjectUrlImage = new BehaviorSubject.seeded(_listUrlImage);
    _listUrlImage.add("assets/images/banner-web-123-CV-02-min.png");
    _listUrlImage.add("assets/images/Banner-Web-060319-min.png");
    _listUrlImage.add("assets/images/viettiep-banner- final.png");
    _listUrlImage.add("assets/images/Banner-Web-060319-min.png");
    _listUrlImage.add("assets/images/VietTiep.Website.VanVoi.png");
    _listUrlImage.add("assets/images/banner3.png");
  }
}
