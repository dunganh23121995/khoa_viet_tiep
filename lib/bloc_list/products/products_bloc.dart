import 'package:http/http.dart';
import 'package:khoaviettiep/call_api_viettiep/api_image_product.dart';
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
            if(body['Data']['ItemNew'] is List){
              ProductsBloc.products = body['Data']['ItemNew'];
            }
            else{
              ProductsBloc.products.clear();
              ProductsBloc.products.add(body['Data']['ItemNew']);
            }
//            ProductsBloc.products.forEach((element) {
////                getImageWithIdProduct(idproduct:element["id"]);
//              ImageProductAPI.Instance().getResponseImageWithIdProduct(idproduct: element['id']).then((response){
//                if(response.statusCode==200){
//                  var url = ProductsApi.Instance().getJsonBodyfromResponse(response)['GetByIDResponse']['GetByIDResult']['Data']['urlsmall'];
//                  element['anhdaidien']=url;
//                  _publishSubjectProducts.sink.add(ProductsBloc.products);
//                }
//              });
//            });
          }
          else{
            //Data is null
            ProductsBloc.products.clear();
            ProductsBloc.products.add({'title':'Sản phẩm hiện chưa có','giaban':'0','giathitruong':'0','anhdaidien':linkdefaultimage});
          }
          _publishSubjectProducts.sink.add(ProductsBloc.products);
        }
      }
    });
  }



}
