class CostItem {
  int id=0;
  int parentId=0;
  String userId='';
  String number="";
  int param=0;
  String unit='';
  int duration=0;
  int value=0;
  int total=0;
  String ops='';
  String name='';

  CostItem({

    this.id=0,
    this.parentId=0,
    this.userId='',
    this.param=0,
    this.duration=0,
    this.number="",
    this.ops='',
    this.unit="",
    this.value=0,
    this.total=0,
    this.name='',
  });

  factory CostItem.fromJson(Map<String, dynamic> parsedJson){

    return CostItem(

      id:              parsedJson['id'] as int,
      parentId:        parsedJson['parentId'] as int,
      userId:          parsedJson['userId'] as String,
      ops:             parsedJson['ops'] as String,
      value:           parsedJson['value'] as int,
      total:           parsedJson['total'] as int,
      number:          parsedJson['number'] as String,
      unit:            parsedJson['unit'] as String,
      duration:        parsedJson['duration'] as int,
      param:           parsedJson['param'] as int,
      name:            parsedJson['name'] as String,

    );
  }

  Map<String, dynamic> toJson() =>{

    'id':              id,
    'parentId':        parentId,
    'userId':          userId,
    'ops':             ops,
    'value':           value,
    'total':           total,
    'number':          number,
    'duration':        duration,
    'param':           param,
    'name':            name,

  };

}