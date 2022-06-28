class RABModel {
  int id=0;
  int parentId=0;
  String userId='';
  String name=''; //item name
  String number=""; // qty
  String classification=""; //unit
  int price=0; //total
  int oldPrice=0; //unit price
  String responseMessage;

  RABModel({

    this.id=0,
    this.parentId=0,
    this.userId='',
    this.name='',
    this.price=0,
    this.oldPrice=0,
    this.number="",
    this.classification='',
    this.responseMessage="",
  });

  factory RABModel.fromJson(Map<String, dynamic> parsedJson){

    return RABModel(

      id:              parsedJson['id'] as int,
      parentId:        parsedJson['parentId'] as int,
      userId:          parsedJson['userId'] as String,
      name:            parsedJson['name'] as String,
      price:           parsedJson['price'] as int,
      oldPrice:        parsedJson['oldPrice'] as int,
      number:          parsedJson['number'] as String,
      classification:  parsedJson['classification'] as String,
      responseMessage: parsedJson['responseMessage'] as String,

    );
  }

  Map<String, dynamic> toJson() =>{

    'id':              id,
    'parentId':        parentId,
    'userId':          userId,
    'name':            name,
    'price':           price,
    'oldPrice':        oldPrice,
    'number':          number,
    'classification':  classification,
    'responseMessage': responseMessage,

  };

}

class PublishedRAB{

  List content = [];

  PublishedRAB({
    required this.content,
  });

  factory PublishedRAB.fromJson(Map<String, dynamic> parsedJson){
    return PublishedRAB(
      content: parsedJson['content'] as List,
    );
  }

}