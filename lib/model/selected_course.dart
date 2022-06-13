class SelectedCourse {


  int id=0;
  int parentId=0;
  String userId="";
  String partnerId="";
  String code="";
  String name="";
  String level="";
  String category="";

  SelectedCourse({
    this.id=0,
    this.parentId=0,
    this.userId='',
    this.partnerId='',
    this.code='',
    this.name='',
    this.level='',
    this.category='',
  });

  factory SelectedCourse.fromJson(Map<String, dynamic> parsedJson){

    return SelectedCourse(

        id: parsedJson['id'] as int,
        parentId: parsedJson['parentId'] as int,
        userId: parsedJson['userId'] as String,
        partnerId: parsedJson['partnerId'] as String,
        code: parsedJson['code'] as String,
        name: parsedJson['name'] as String,
        level: parsedJson['level'] as String,
        category: parsedJson['category'] as String,

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
    'category': category,

  };

}