import 'package:khoaviettiep/call_api_viettiep/end_point.dart';

class ProductsApi extends EndPoint{
  static ProductsApi _productsApi;
  factory ProductsApi(){
    _productsApi==null?{_productsApi = ProductsApi.Instance()}:{};
    return _productsApi;
  }
  ProductsApi.Instance();

   static String body='';

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

   Future getResponseProductsWithIdMenu({idMenu}){
    ProductsApi.body = '''
          <pagesize>10</pagesize>
      <currentpage>1</currentpage>
      <idmenu>${idMenu}</idmenu>
      <active>true</active>
      <_itemcount>0</_itemcount>
    ''';
    return getResponse();
  }

}