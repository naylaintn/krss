class Product {
  int id=0;
  String partner='';
  String classid='';
  String userId='';
  String code='';
  String providerCode='';
  String type='';
  String brand='';
  String name='';
  String typeModel='';
  String title='';
  String description='';
  String category='';
  String subCategory='';
  String market='';
  int price=0;
  int oldPrice=0;
  String url='';
  String avatarLink='';
  String pictureLink='';
  int processingCode=0;
  String updatedAt='';
  String status='';
  int priority = 0;

  Product({
    this.id=0,
    this.partner='',
    this.classid='',
    this.userId='',
    this.code='',
    this.providerCode='',
    this.type='',
    this.brand='',
    this.name='',
    this.typeModel='',
    this.title='',
    this.description='',
    this.category='',
    this.subCategory='',
    this.market='',
    this.price=0,
    this.oldPrice=0,
    this.url='',
    this.avatarLink='',
    this.pictureLink='',
    this.processingCode=0,
    this.updatedAt='',
    this.status='',
    this.priority=0,
  });

  factory Product.fromJson(Map<String, dynamic> parsedJson){
    return Product(

      id:              parsedJson['id'] as int,
      partner:         parsedJson['partner'] as String,
      classid:         parsedJson['classid'] as String,
      userId:          parsedJson['userId'] as String,
      code:            parsedJson['code'] as String,
      providerCode:    parsedJson['providerCode'] as String,
      type:            parsedJson['type'] as String,
      brand:           parsedJson['brand'] as String,
      name:            parsedJson['name'] as String,
      typeModel:       parsedJson['typeModel'] as String,
      title:           parsedJson['title'] as String,
      description:     parsedJson['description'] as String,
      category:        parsedJson['category'] as String,
      subCategory:     parsedJson['subCategory'] as String,
      market:          parsedJson['market'] as String,
      price:           parsedJson['price'] as int,
      oldPrice:        parsedJson['oldPrice'] as int,
      url:             parsedJson['url'] as String,
      avatarLink:      parsedJson['avatarLink'] as String,
      pictureLink:     parsedJson['pictureLink'] as String,
      processingCode:  parsedJson['processingCode'] as int,
      updatedAt:       parsedJson['updatedAt'] as String,
      status:          parsedJson['status'] as String,
      priority:        parsedJson['priority'] as int,

    );
  }

  Map<String, dynamic> toJson() => {

    'id':  id,
    'partner': partner,
    'classid': classid,
    'userId': userId,
    'code':  code,
    'providerCode':  providerCode,
    'type':  type,
    'brand':  brand,
    'name':  name,
    'typeModel':  typeModel,
    'title':  title,
    'description':  description,
    'category':  category,
    'subCategory':  subCategory,
    'market':  market,
    'price':  price,
    'oldPrice': oldPrice,
    'url':  url,
    'avatarLink':  avatarLink,
    'pictureLink':  pictureLink,
    'processingCode':  processingCode,
    'updatedAt':  updatedAt,
    'status': status,
    'priority': priority,

  };


}