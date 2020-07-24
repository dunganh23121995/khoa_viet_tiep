import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  List products;
  PublishSubject _publishSubjectProducts;
  Stream get productsStream =>_publishSubjectProducts.stream;

  ProductsBloc():products=new List(),
  _publishSubjectProducts = new PublishSubject(){
  }

  getProducts({idmenu}){

  }
}
