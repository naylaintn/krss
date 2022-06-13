import 'dart:io';

class PageUi {

  int id=0;
  String pageName='';
  String appsName='';
  String description='';
  bool published=false;

  PageUi({
    this.id=0,
    this.pageName='',
    this.appsName='',
    this.description='',
    //this.published=false,
  });

  factory PageUi.fromJson(Map<String, dynamic> parsedJson){
    return PageUi(
      id: parsedJson['id'] as int,
      pageName: parsedJson['pageName'] as String,
      appsName: parsedJson['appsName'] as String,
      description: parsedJson['description'] as String,
      //published: parsedJson['published'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'pageName' : pageName,
    'appsName' : appsName,
    'description': description,
    //'published': published,
  };

}