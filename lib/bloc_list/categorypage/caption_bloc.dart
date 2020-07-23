import 'package:khoaviettiep/call_api_viettiep/api_catergory_menu.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class CaptionBloc {
  List<Map<String, dynamic>> listcaption;
  BehaviorSubject<List> _behaviorSubjectCaption;
  BehaviorSubject<Map<String, dynamic>> _behaviorSubjectMenu;
  BehaviorSubject<int> _behaviorSubjectIndex;

  Stream get captionStream {
    MenuApi.Instance().getResponseMenu(catid: 195).then((response) {
      if (response.statusCode == 200) {
        var body = MenuApi.Instance().getJsonBodyfromResponse(response);
        if (body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['ErrCode'] ==
            ErrCodeSuccess.toString()) {
          _behaviorSubjectCaption.sink
              .add(body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['Data']['menu']);
          _behaviorSubjectIndex.sink.add(0);
        }
      }
    });
    return _behaviorSubjectCaption.stream;
  }

  Stream get indexStream {
    //Xu ly subcaption here
    return _behaviorSubjectIndex.stream;
  }

  onClickCaption({index}) {
    _behaviorSubjectIndex.sink.add(index);
  }

  CaptionBloc()
      : listcaption = new List(),
        _behaviorSubjectCaption = new BehaviorSubject(),
        _behaviorSubjectMenu = new BehaviorSubject(),
        _behaviorSubjectIndex = new BehaviorSubject() {}
}
