import 'package:khoaviettiep/call_api_viettiep/api_catergory.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class CaptionBloc{
  List<Map<String,dynamic>> listcaption;
  BehaviorSubject<List> _behaviorSubject;
  Stream get captionStream{

    MenuApi.Instance().getResponse().then((response){
      if(response.statusCode==200){
        var body = MenuApi.Instance().getJsonBodyfromResponse(response);
        if(body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['ErrCode']==ErrCodeSuccess.toString()){
          _behaviorSubject.sink.add(body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['Data']['menu']);
        }
      }
    });
    return _behaviorSubject.stream;
  }



  CaptionBloc(): listcaption=new List(),
  _behaviorSubject=new BehaviorSubject(){


  }

}