import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:khoaviettiep/call_api_viettiep/api_image_product.dart';
import 'package:khoaviettiep/call_api_viettiep/api_products_idmenu.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailsBloc {
  static ProductDetailsBloc _productsBloc;
  factory ProductDetailsBloc(){
    _productsBloc==null?{_productsBloc=new ProductDetailsBloc()}:{};
    return _productsBloc;
  }
  ProductDetailsBloc.Instance();

  static Map productdetails=new Map();
  static PublishSubject _publishSubjectProducts=new PublishSubject();
  Stream get productsStream =>_publishSubjectProducts.stream;
  getProductDetails({@required idproduct}){
    ProductsApi.Instance().getResponseProductDetails(idproduct: idproduct).then((fresponse){
      Response response = fresponse;
      if(response.statusCode==200){
        print(response.body);
      }
    });
  }


}
