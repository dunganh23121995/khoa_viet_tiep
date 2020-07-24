import 'package:khoaviettiep/call_api_viettiep/api_catergory_menu.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class CaptionBloc {
  List listcaption;
  List listmenu;
  int indexcaption;
  PublishSubject<List> _behaviorSubjectCaption;
  PublishSubject<List> _behaviorSubjectMenu;
  PublishSubject<int> _behaviorSubjectIndex;


  Stream get captionStream {

    return _behaviorSubjectCaption.stream;
  }

  Stream get indexStream {
    //Xu ly subcaption here
    return _behaviorSubjectIndex.stream;
  }

  Stream get menuStream{

    return _behaviorSubjectMenu.stream;
  }

  onClickCaption({index}) {
    indexcaption=index;
    _behaviorSubjectIndex.sink.add(index);

    if(listcaption.length!=0){
      MenuApi.Instance().getResponseMenu(catid: int.parse(listcaption[indexcaption]['id'])).then((response) {
        if (response.statusCode == 200) {
          var body = MenuApi.Instance().getJsonBodyfromResponse(response);
          if (body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['ErrCode'] ==
              ErrCodeSuccess.toString()) {
            listmenu = body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['Data']['menu'];
            print(listmenu);
            _behaviorSubjectMenu.sink
                .add(listmenu);
          }
        }
      });
    }

  }

  CaptionBloc()
      : listcaption = new List(),
        _behaviorSubjectCaption = new PublishSubject(),
        _behaviorSubjectIndex = new PublishSubject(),
        _behaviorSubjectMenu=new PublishSubject(),
        indexcaption=0{

    MenuApi.Instance().getResponseMenu(catid: 195).then((response) {
      if (response.statusCode == 200) {
        var body = MenuApi.Instance().getJsonBodyfromResponse(response);
        if (body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['ErrCode'] ==
            ErrCodeSuccess.toString()) {
          listcaption = body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['Data']['menu'];
          _behaviorSubjectCaption.sink
              .add(listcaption);
          _behaviorSubjectIndex.sink.add(indexcaption);
          // Lay menu cho caption dau
          if(listcaption.length!=0){
            MenuApi.Instance().getResponseMenu(catid: int.parse(listcaption[0]['id'])).then((response) {
              if (response.statusCode == 200) {
                var body = MenuApi.Instance().getJsonBodyfromResponse(response);
                if (body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['ErrCode'] ==
                    ErrCodeSuccess.toString()) {
                  listmenu = body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['Data']['menu'];
                  print(listmenu);
                  _behaviorSubjectMenu.sink
                      .add(listmenu);
                }
              }
            });
          }



        }
      }
    });
  }
}
