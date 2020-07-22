import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:khoaviettiep/call_api_viettiep/end_point.dart';
import 'package:khoaviettiep/lists_variable.dart';

class ProductApi extends EndPoint{
static ProductApi _productApi;
factory ProductApi(){
  if(_productApi==null){
      _productApi = ProductApi.Instance();
  }
  return _productApi;
}
ProductApi.Instance();

  @override
  String action() {
    // TODO: implement action
    return 'GetMenuByTypeAndCatID';
  }

  @override
  String bodysoap() {
    // TODO: implement bodysoap
    return '''
      <id_menu_vitri>1</id_menu_vitri>
      <Type>
        <string>san-pham</string>
      </Type>
      <catid>195</catid>
      <lang>1</lang>
 ''';
  }

  @override
  String nameModuleService() {
    // TODO: implement moduleService
    return 'WebService_Menu';
  }



Future<String>  getCategoryListTitle() async{
  Future<http.Response> fresponse = this.getResponse();

  await fresponse.then((response) {
    if(response.statusCode==200){
     Map body = getJsonBodyfromResponse(response);
     if(body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['ErrCode']==ErrCodeSuccess.toString()){
       print(body['GetMenuByTypeAndCatIDResponse']['GetMenuByTypeAndCatIDResult']['Data']['menu']);
       return  new Future.value("meow");
     }
     return null;
    }
  });

//  return getResponse(moduleService: "WebService_Product", action: "getTop", bodyaction: body);
}


}