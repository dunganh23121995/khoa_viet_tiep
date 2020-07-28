import 'package:flutter/cupertino.dart';
import 'package:khoaviettiep/call_api_viettiep/api_products_idmenu.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class BodyHomeBloc{
  static BodyHomeBloc _bodyHomeBloc;
  factory BodyHomeBloc(){
    _bodyHomeBloc==null?{_bodyHomeBloc=BodyHomeBloc.Instance()}:{};
    return _bodyHomeBloc;
  }
  BodyHomeBloc.Instance();

  static PublishSubject<List> _publishSubjectCardProduct = new PublishSubject();
   Stream get cardProductStream{
    ProductsApi.Instance().getResponseProductsTopWithIsHot().then((response){
      if(response.statusCode==200){
        var body = ProductsApi.Instance().getJsonBodyfromResponse(response);
        if(body['getTopWithIshotResponse']['getTopWithIshotResult']['ErrCode']==ErrCodeSuccess.toString()){
          List list = body['getTopWithIshotResponse']['getTopWithIshotResult']['Data']['ItemNew'];
          _publishSubjectCardProduct.sink.add(list);
        }
      }
    });
    return _publishSubjectCardProduct.stream;
  }
  

}