class Level {

  int id=0;
  int parentId=0;
  String partnerId;
  String name;
  String description;

  Level({
    this.id=0,
    this.parentId=0,
    this.partnerId='',
    this.name='',
    this.description='',
  });

  factory Level.fromJson(Map<String, dynamic> parsedJson){
    return Level(
      id         :  parsedJson['id'] as int,
      parentId   :  parsedJson['parentId'] as int,
      partnerId  :  parsedJson['partnerId'] as String,
      name       :  parsedJson['name'] as String,
      description:  parsedJson['description'] as String,
    );
  }

  Map<String, dynamic> toJson()=> {
    'id'          : id,
    'parentId'    : parentId,
    'partnerId'   : partnerId,
    'name'        : name,
    'description' : description,
  };

}