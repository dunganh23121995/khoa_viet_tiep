import 'package:http/http.dart' as http;
import 'package:khoaviettiep/call_api_viettiep/end_point.dart';

class ProductApi extends EndPoint{
static ProductApi _productApi;
factory ProductApi(){
  if(_productApi==null){
      _productApi = ProductApi.Instance();
  }
  return _productApi;
}
ProductApi.Instance();

 Future<http.Response>  getCategoryTitle() {
  String body = '''
  <ns1:getTop>
  <ns1:quantity>20</ns1:quantity>
  <ns1:idmenu>195</ns1:idmenu>
  <ns1:active>true</ns1:active>
  </ns1:getTop>''';
  return getResponse(moduleService: "WebService_Product", action: "getTop", bodyaction: body);
}




}