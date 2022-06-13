class TransCourse{

  int id=0;
  int parentId=0;
  String userId="";
  String partnerId="";
  String code="";
  String name="";
  String level="";
  String score="";

  TransCourse({
    this.id=0,
    this.parentId=0,
    this.userId='',
    this.partnerId='',
    this.code='',
    this.name='',
    this.level='',
    this.score='',
  });

  factory TransCourse.fromJson(Map<String, dynamic> parsedJson){

    return TransCourse(

      id: parsedJson['id'] as int,
      parentId: parsedJson['parentId'] as int,
      userId: parsedJson['userId'] as String,
      partnerId: parsedJson['partnerId'] as String,
      code: parsedJson['code'] as String,
      name: parsedJson['name'] as String,
      level: parsedJson['level'] as String,
      score: parsedJson['score'] as String,

    );

  }

  Map<String, dynamic> toJson()=> {

    'id': id,
    'parentId': parentId,
    'userId': userId,
    'partnerId': partnerId,
    'code': code,
    'name': name,
    'level': level,
    'score': score,

  };


}