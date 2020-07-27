import 'package:khoaviettiep/call_api_viettiep/end_point.dart';

class ImageProductAPI extends EndPoint{
  static ImageProductAPI _productsApi;
  factory ImageProductAPI(){
    _productsApi==null?{_productsApi = ImageProductAPI.Instance()}:{};
    return _productsApi;
  }
  ImageProductAPI.Instance();

  static String body='';

  @override
  String action() {
    // TODO: implement action
    return "GetByID";
  }

  @override
  String bodysoap() {
    // TODO: implement bodysoap
    return body;
  }

  @override
  String nameModuleService() {
    // TODO: implement nameModuleService
    return "WebService_ProductImg";
  }

  Future getResponseImageWithIdProduct({idproduct}){
    ImageProductAPI.body = '''
       <id>${idproduct}</id>
    ''';
    return getResponse();
  }
}