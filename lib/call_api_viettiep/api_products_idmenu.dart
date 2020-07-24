import 'package:khoaviettiep/call_api_viettiep/end_point.dart';

class ProductsApi extends EndPoint{
  String body='';
  @override
  String action() {
    // TODO: implement action
    return "getPagedWithIDMenu";
  }

  @override
  String bodysoap() {
    // TODO: implement bodysoap
    return body;
  }

  @override
  String nameModuleService() {
    // TODO: implement nameModuleService
    return "WebService_Product";
  }

  getResponseProductsWithIdMenu({idMenu}){
    this.body = '''
          <pagesize>10</pagesize>
      <currentpage>1</currentpage>
      <idmenu>${idMenu}</idmenu>
      <active>true</active>
      <_itemcount>0</_itemcount>
    ''';
    return getResponse();
  }
}