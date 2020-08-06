import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:khoaviettiep/call_api_viettiep/api_products_idmenu.dart';
import 'package:khoaviettiep/entity/product.dart';
import 'package:khoaviettiep/lists_variable.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailsBloc {
  static ProductDetailsBloc _productsBloc;
  factory ProductDetailsBloc(){
    _productsBloc==null?{_productsBloc=new ProductDetailsBloc()}:{};
    productdetails=new Product();
    return _productsBloc;
  }
  ProductDetailsBloc.Instance();

  static Product productdetails=new Product();

  static BehaviorSubject<Product> _publishSubjectProducts=new BehaviorSubject<Product>();
  Stream get productStream =>_publishSubjectProducts.stream;
  getProductDetails({@required idproduct}){
    _numberproduct=1;
    ProductsApi.Instance().getResponseProductDetails(idproduct: idproduct).then((fresponse){
      Response response = fresponse;
      if(response.statusCode==200){
        var body  = ProductsApi.Instance().getJsonBodyfromResponse(response)['GetByIDResponse']['GetByIDResult'];
        if(body['ErrCode']==ErrCodeSuccess.toString()){
          if(body['Data']!=null){
            print(body['Data']);
             productdetails.fromMap(body['Data']);
            _publishSubjectProducts.sink.add(productdetails);
            _publishSubjectNumberProduct.sink.add(_numberproduct);
          }
        }
      }
    });
  }

  int _numberproduct=1;
  static PublishSubject _publishSubjectNumberProduct = new PublishSubject();
  Stream get numberproduct{
    return _publishSubjectNumberProduct.stream;
  }


  submitIncreaseNumber(){
    if(_numberproduct<9999){
      _numberproduct++;
    }
  }

}
