
class Feature {

  int id=0;
  int parentId=0;
  String code='';
  String groupFeature='';
  String feature='';
  String name='';
  String value='';
  String description='';
  String properties='';
  String pictureUrl='';

  Feature({
    this.id=0,
    this.parentId=0,
    this.code='',
    this.groupFeature='',
    this.feature='',
    this.name='',
    this.value='',
    this.description='',
    this.properties='',
    this.pictureUrl='',
  });

  factory Feature.fromJson(Map<String, dynamic> parsedJson){
    return Feature(
      id:           parsedJson['id'] as int,
      parentId:     parsedJson['parentId'] as int,
      code:         parsedJson['code'] as String,
      groupFeature: parsedJson['groupFeature'] as String,
      feature:      parsedJson['feature'] as String,
      name:         parsedJson['name'] as String,
      value:        parsedJson['value'] as String,
      description:  parsedJson['description'] as String,
      properties:   parsedJson['properties'] as String,
      pictureUrl:   parsedJson['pictureUrl'] as String,

    );
  }

  Map<String, dynamic> toJson() =>{

    'parentId':     parentId,
    'code':         code,
    'groupFeature': groupFeature,
    'feature':      feature,
    'name':         name,
    'value':        value,
    'description':  description,
    'properties':   properties,
    'pictureUrl':   pictureUrl,
   
  };


}