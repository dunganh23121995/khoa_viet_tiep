import 'package:http/http.dart';
import 'package:khoaviettiep/call_api_viettiep/api_products_idmenu.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  static ProductsBloc _productsBloc;
  factory ProductsBloc(){
    _productsBloc==null?{_productsBloc=new ProductsBloc()}:{};
    return _productsBloc;
  }
  ProductsBloc.Instance();

  static List products=new List();
  static PublishSubject _publishSubjectProducts=new PublishSubject();
  Stream get productsStream =>_publishSubjectProducts.stream;

  getProductsWithId({idmenu}){
    ProductsApi.Instance().getResponseProductsWithIdMenu(idMenu: idmenu).then((response){
      if(response.statusCode==200){
        var body = ProductsApi.Instance().getJsonBodyfromResponse(response)['getPagedWithIDMenuResponse']['getPagedWithIDMenuResult'];
        if(body['ErrCode']==ErrCodeSuccess.toString()){
          if(body['Data']!=null){
            print(body.toString()+"BODY HEREEEE");
            ProductsBloc.products = body['Data']['ItemNew'];

            _publishSubjectProducts.sink.add(body['Data']['ItemNew']);

          }
        }
      }
    });
  }
}
