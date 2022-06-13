import 'package:flutter/cupertino.dart';

import 'degree.dart';

class Classification{

  int id=0;
  int parentId=0;
  String partnerId='';
  String name='';
  String description='';
  List<Degree> degrees=[];

  Classification({
    this.id=0,
    this.parentId=0,
    this.partnerId='',
    this.name='',
    this.description='',
    required this.degrees,
  });

  factory Classification.fromJson(Map<String, dynamic> parsedJson){
    List list = parsedJson['degrees'] as List;
    return Classification(
      id         :  parsedJson['id'] as int,
      parentId   :  parsedJson['parentId'] as int,
      partnerId  :  parsedJson['partnerId'] as String,
      name       :  parsedJson['name'] as String,
      description:  parsedJson['description'] as String,
      degrees    :  list.map((e) => Degree.fromJson(e)).toList(),
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