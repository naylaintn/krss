import 'level.dart';

class Degree {

  int id=0;
  int parentId=0;
  String partnerId='';
  String name='';
  String description='';
  List<Level> levels = [];

  Degree({
    this.id=0,
    this.parentId=0,
    this.partnerId='',
    this.name='',
    this.description='',
    required this.levels,
  });

  factory Degree.fromJson(Map<String, dynamic> parsedJson){
    List list = parsedJson['levels'] as List;
    return Degree(
      id         :  parsedJson['id'] as int,
      parentId   :  parsedJson['parentId'] as int,
      partnerId  :  parsedJson['partnerId'] as String,
      name       :  parsedJson['name'] as String,
      description:  parsedJson['description'] as String,
      levels     :  list.map((e) => Level.fromJson(e)).toList(),
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