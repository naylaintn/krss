

import 'classification.dart';

class Branch {

  int id=0;
  int parentId=0;
  String userId='';
  String partnerId='';
  String branchName='';
  String branchDescription='';
  List<Classification> classifications=[];

  Branch({
    this.id=0,
    this.parentId=0,
    this.userId='',
    this.partnerId='',
    this.branchName='',
    this.branchDescription='',
    required this.classifications,
  });

  factory Branch.fromJson(Map<String, dynamic> parsedJson){
    List list = parsedJson['classifications'] as List;
    return Branch(
      id:         parsedJson['id'] as int,
      parentId:   parsedJson['parentId'] as int,
      userId:     parsedJson['userId'] as String,
      partnerId:  parsedJson['partnerId'] as String,
      branchName: parsedJson['branchName'] as String,
      branchDescription: parsedJson['branchDescription'] as String,
      classifications: list.map((e) => Classification.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson()=>{

    'id':                 id,
    'parentId':           parentId,
    'userId':             userId,
    'partnerId':          partnerId,
    'branchName':         branchName,
    'branchDescription':  branchDescription,

  };

}