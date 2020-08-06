class Product{
  String name,idproduct,catid,color,material,design,numberkey,action,standard,linkimage,content,useto,
      size,guarantee,pack,doorthickness,lockbody;
  bool ishot,isbestbuy,active,isnewest,isuse;
  int saleoff,price,cost;

  fromMap(Map obj){
      name=obj['title'];
      catid=obj['catid'];
      guarantee = obj['baohanh'];
      price=int.parse(obj['giaban']);
      cost=int.parse(obj['giathitruong']);
      this.linkimage=obj['anhdaidien'];
      content = obj['content'];
      active =bool.fromEnvironment(obj['active']);
      isuse =bool.fromEnvironment(obj['isuse']);
      ishot =bool.fromEnvironment(obj['ishot']);
      isbestbuy =bool.fromEnvironment(obj['isbestbuy']);
      isnewest =bool.fromEnvironment(obj['isnewest']);
      idproduct = obj['masp'];
      color= (obj['NewColumn1']!='null')?obj['NewColumn1']:null;
      material= (obj['NewColumn2']!='null')?obj['NewColumn2']:null;
      design= (obj['NewColumn3']!='null')?obj['NewColumn3']:null;
      numberkey= (obj['NewColumn4']!='null')?obj['NewColumn4']:null;
      action= (obj['NewColumn5']!='null')?obj['NewColumn5']:null;
      standard= (obj['NewColumn6']!='null')?obj['NewColumn6']:null;
      useto= (obj['NewColumn7']!='null')?obj['NewColumn7']:null;
      size= (obj['NewColumn9']!='null')?obj['NewColumn9']:null;
      pack= (obj['NewColumn10']!='null')?obj['NewColumn10']:null;
      doorthickness= (obj['NewColumn17']!='null')?obj['NewColumn17']:null;
      lockbody= (obj['NewColumn15']!='null')?obj['NewColumn15']:null;
      saleoff = int.parse(obj['saleoff']);
  }
}