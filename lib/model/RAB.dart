class RAB {
  int id=0;
  String userId='';
  String name=''; //item name
  String number=""; // qty
  String classification=""; //unit
  int price=0; //total
  int oldPrice=0; //unit price

  RAB({

    this.id=0,
    this.userId='',
    this.name='',
    this.price=0,
    this.oldPrice=0,
    this.number="",
    this.classification='',
  });

  factory RAB.fromJson(Map<String, dynamic> parsedJson){

    return RAB(

      id:              parsedJson['id'] as int,
      userId:          parsedJson['userId'] as String,
      name:            parsedJson['name'] as String,
      price:           parsedJson['price'] as int,
      oldPrice:        parsedJson['oldPrice'] as int,
      number:          parsedJson['number'] as String,
      classification:  parsedJson['classification'] as String,

    );
  }

  Map<String, dynamic> toJson() =>{

    'id':              id,
    'userId':          userId,
    'name':            name,
    'price':           price,
    'oldPrice':        oldPrice,
    'number':          number,
    'classification':  classification,

  };

}