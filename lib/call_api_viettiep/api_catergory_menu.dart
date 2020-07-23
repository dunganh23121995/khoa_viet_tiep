import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:khoaviettiep/call_api_viettiep/end_point.dart';
import 'package:khoaviettiep/lists_variable.dart';

class MenuApi extends EndPoint{
static MenuApi _productApi;
factory MenuApi(){
  if(_productApi==null){
      _productApi = MenuApi.Instance();
  }
  return _productApi;
}
int catid;
MenuApi.Instance();

  @override
  String action() {
    // TODO: implement action
    return 'GetMenuByTypeAndCatID';
  }

  getResponseMenu({catid=195}){
      this.catid=catid;
      return getResponse();
  }

  @override
  String bodysoap() {
    // TODO: implement bodysoap
    return '''
      <id_menu_vitri>1</id_menu_vitri>
      <Type>
        <string>san-pham</string>
      </Type>
      <catid>${this.catid}</catid>
      <lang>1</lang>
 ''';
  }

  @override
  String nameModuleService() {
    // TODO: implement moduleService
    return 'WebService_Menu';
  }


}