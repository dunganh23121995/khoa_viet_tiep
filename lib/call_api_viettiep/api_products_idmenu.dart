import 'package:khoaviettiep/call_api_viettiep/end_point.dart';

class ProductsApi extends EndPoint{
  static ProductsApi _productsApi;
  factory ProductsApi(){
    _productsApi==null?{_productsApi = ProductsApi.Instance()}:{};
    return _productsApi;
  }
  ProductsApi.Instance();

   static String body='';
  static String myaction ='';
  @override
  String action() {
    // TODO: implement action
    return myaction;
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
    myaction = 'getPagedWithIDMenu';
    ProductsApi.body = '''
          <pagesize>10</pagesize>
      <currentpage>1</currentpage>
      <idmenu>${idMenu}</idmenu>
      <active>true</active>
      <_itemcount>0</_itemcount>
    ''';
    return getResponse();
  }
  Future getResponseProductsTopWithIsHot(){
    myaction = 'getTopWithIshot';
    ProductsApi.body = '''
        <quantity>10</quantity>
      <idmenu>-1</idmenu>
      <active>true</active>
      <ishot>true</ishot>
    ''';
    return getResponse();
  }

  Future getResponseProductDetails({idproduct}){
    myaction = 'GetByID';
    ProductsApi.body = '''
        <id>${idproduct}</id>
    ''';
    return getResponse();
  }
}