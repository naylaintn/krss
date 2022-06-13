class Section {

  int id=0;
  String outletId="";
  String code="";
  String userId="";
  String partner=""; // code name of partner
  String classification=""; // elementary , senior/junior highschool, university/institute, D1, D2, D3
  String level="";  // class, semester
  String title="";
  String description="";
  String otherData="";
  String duration="";
  String number="";
  List sectionItems=[];
  List<SectionItem> sectionItemList=<SectionItem>[];

  Section({
    this.id=0,
    this.outletId="",
    this.code="",
    this.userId="",
    this.partner="",
    this.classification='',
    this.level="",
    this.title="",
    this.description="",
    this.otherData="",
    this.duration="",
    this.number="",
    required this.sectionItems,
  });

  factory Section.fromJson(Map<String, dynamic> parsedJson){

    return Section(
      id:              parsedJson['id'] as int,
      outletId:        parsedJson['outletId'] as String,
      code:            parsedJson['code'] as String,
      userId:          parsedJson['userId'] as String,
      partner:         parsedJson['partner'] as String,
      classification:  parsedJson['classification'] as String,
      level:           parsedJson['level'] as String,
      title:           parsedJson['title'] as String,
      description:     parsedJson['description'] as String,
      otherData:       parsedJson['otherData'] as String,
      duration:        parsedJson['duration'] as String,
      number:          parsedJson['number'] as String,
      sectionItems:    parsedJson['sectionItemList'] as List,

    );
  }

  Map<String, dynamic> toJson() =>{

     'id':              id,
     'outletId':        outletId,
     'code':            code,
     'userId':          userId,
     'partner':         partner,
     'classification':  classification,
     'level':           level,
     'title':           title,
     'description':     description,
     'otherData':       otherData,
     'duration':        duration,
     'number':          number,
    
   };


}

class SectionItem {

  int    id=0;
  int    parentId=0;
  String code="";
  String partner="";
  String classification="";
  String userId="";
  String title="";
  String description="";
  String contentType="";  //pdf, text/html, video, youtube
  String contentLink="";  //link of file location key in database
  String otherData="";
  String duration="";
  String number="";
  bool   done=false;

  SectionItem({
    this.id=0,
    this.parentId=0,
    this.code="",
    this.partner="",
    this.classification="",
    this.userId="",
    this.title="",
    this.description="",
    this.contentType="",
    this.contentLink="",
    this.otherData="",
    this.duration="",
    this.number="",
    this.done=false,
  });

  factory SectionItem.fromJson(Map<String, dynamic> parsedJson){

    return SectionItem(

        id:              parsedJson['id'] as int,
        parentId:        parsedJson['parentId'] as int,
        code:            parsedJson['code'] as String,
        partner:         parsedJson['partner'] as String,
        classification:  parsedJson['classification'] as String,
        userId:          parsedJson['userId'] as String,
        title:           parsedJson['title'] as String,
        description:     parsedJson['description'] as String,
        contentType:     parsedJson['contentType'] as String,
        contentLink:     parsedJson['contentLink'] as String,
        otherData:       parsedJson['otherData'] as String,
        duration:        parsedJson['duration'] as String,
        number:          parsedJson['number'] as String,
        done:            parsedJson['done'] as bool,

    );
  }

  Map<String, dynamic> toJson() =>{

    'id':              id,
    'parentId':        parentId,
    'code':            code,
    'partner':         partner,
    'classification':  classification,
    'userId':          userId,
    'title':           title,
    'description':     description,
    'contentType':     contentType,
    'contentLink':     contentLink,
    'otherData':       otherData,
    'duration':        duration,
    'number':          number,
    'done':            done,          
  };


}