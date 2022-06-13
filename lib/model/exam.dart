import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ExamTitle{

  int id=0;
  int parentId=0; //parentId is sectionItem
  String userId='';
  String code='';
  String partner=''; // code name of partner
  String classification=''; // elementary , senior/junior highschool, university/institute, D1, D2, D3
  String level='';  // class, semester
  String title='';
  String subject='';
  double exGrade=100.0;
  double maxGrade=100.0;
  String publication='';  //public or private or private_share
  int titleLevel=0; // default = 0
  int examDate=0;   // timemilis
  int submissionDate=0;
  int correctionDate=0;
  DateTime createdAt=DateTime.now();
  DateTime updatedAt=DateTime.now();
  late List<ExamGroup> examGroups=<ExamGroup>[];

  ExamTitle({
    this.id=0,
    this.parentId=0,
    this.userId='',
    this.code='',
    this.partner='',
    this.classification='',
    this.level='',
    this.title='',
    this.subject='',
    this.exGrade=100.0,
    this.maxGrade=100.0,
    this.publication='',
    this.titleLevel=0,
    this.examDate=0,
    this.submissionDate=0,
    this.correctionDate=0,
    required this.createdAt,
    required this.updatedAt,
    required this.examGroups,
  });

  factory ExamTitle.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['examGroups'] as List;

    return ExamTitle(
          id:             parsedJson['id'] as int,
          parentId:       parsedJson['parentId'] as int,
          userId:         parsedJson['userId'] as String,
          code:           parsedJson['code'] as String,
          partner:        parsedJson['partner'] as String,
          classification: parsedJson['classification'] as String,
          level:          parsedJson['level'] as String,
          title:          parsedJson['title'] as String,
          subject:        parsedJson['subject'] as String,
          exGrade:        parsedJson['exGrade'] as double,
          maxGrade:       parsedJson['maxGrade'] as double,
          publication:    parsedJson['publication'] as String,
          titleLevel:     parsedJson['titleLevel'] as int,
          examDate:       parsedJson['examDate'] as int,
          submissionDate: parsedJson['submissionDate'] as int,
          correctionDate: parsedJson['correctionDate'] as int,
          createdAt:      DateTime.parse(parsedJson['createdAt']==null?DateTime.now().toIso8601String():parsedJson['createdAt']),
          updatedAt:      DateTime.parse(parsedJson['updatedAt']==null?DateTime.now().toIso8601String():parsedJson['updatedAt']),
          examGroups: list.map((e)=>ExamGroup.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() =>{
         'id':              id,
         'parentId':        parentId,
         'userId':          userId,
         'code':            code,
         'partner':         partner,
         'classification':  classification,
         'level':           level,
         'title':           title,
         'subject':         subject,
         'exGrade':         exGrade,
         'maxGrade':        maxGrade,
         'publication':     publication,
         'titleLevel':      titleLevel,
         'examDate':        examDate,
         'submissionDate':  submissionDate,
         'correctionDate':  correctionDate,
         //'examStatements':  examStatements,
  };


}


class ExamGroup {

  int id=0;
  int examTitleId=0;
  String type='';
  int number=0;
  String name='';
  double weight=0;
  double score=0;
  List<ExamStatement> examStatements = <ExamStatement>[];
  var expanded = Rx(false).obs;

  ExamGroup({
    this.id=0,
    this.examTitleId=0,
    this.type='',
    this.number=0,
    this.name='',
    this.weight=0,
    this.score=0,
    required this.examStatements,
  });

  factory ExamGroup.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['examContents'] as List;

    return ExamGroup(

      id: parsedJson['id'] as int,
      examTitleId: parsedJson['examTitleId'] as int,
      type: parsedJson['type'] as String,
      number: parsedJson['number'] as int,
      name: parsedJson['name'] as String,
      weight: parsedJson['weight'] as double,
      score: parsedJson['score'] as double,
      examStatements: list.map((e)=>ExamStatement.fromJson(e)).toList(),

    );

  }

  Map<String, dynamic> toJson() =>{
    'id': id,
    'examTitleId': examTitleId,
    'type': type,
    'number': number,
    'name': name,
    'weight': weight,
    'score': score,
  };

}


class ExamStatement{

  int id=0;
  int examGroupId=0; // id from ExamTitle
  String userId='';
  String subject='';
  int number=0;
  String problemStatement='';   // in case of MC
  String type='';  // multiple choice (mc), essay, mc one answer, mc multiple answer, project
  String publication='';  //public or private or private_share
  double grade = 1.0;
  double falseGrade = 1.0;
  double nopGrade = 1.0;
  int answer = 0;
  late List<ExamQuest> options;
  ExamEssay examEssay = ExamEssay(examScores: []);
  var expanded = Rx(false).obs;
  var answerRx = 0.obs;

  ExamStatement({
    this.id=0,
    this.examGroupId=0,
    this.userId='',
    this.subject='',
    this.number=0,
    this.problemStatement='',
    this.type='',
    this.publication='',
    this.grade = 1.0,
    this.falseGrade = -1.0,
    this.nopGrade = 0,
    this.answer = 0,
    required this.options,
    required this.examEssay,
  });

  factory ExamStatement.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['options'] as List;

    return ExamStatement(
        id:               parsedJson['id'] as int,
        examGroupId:      parsedJson['examGroupId'] as int,
        userId:           parsedJson['userId'] as String,
        subject:          parsedJson['subject'] as String,
        number:           parsedJson['number'] as int,
        problemStatement: parsedJson['problemStatement'] as String,
        type:             parsedJson['type'] as String,
        publication:      parsedJson['publication'] as String,
        grade:            parsedJson['grade'] as double,
        falseGrade:       parsedJson['falseGrade'] as double,
        nopGrade:         parsedJson['nopGrade'] as double,
        answer:           parsedJson['answer'] as int,
        options:          list.map((e)=>ExamQuest.fromJson(e)).toList(),
        examEssay:        ExamEssay.fromJson(parsedJson['examEssay']),
    );


  }

  Map<String, dynamic> toJson() =>{
      'id':               id,
      'examGroupId':      examGroupId,
      'userId':           userId,
      'subject':          subject,
      'number':           number,
      'problemStatement': problemStatement,
      'type':             type,
      'publication':      publication,
      'grade':            grade,
      'falseGrade':       falseGrade,
      'nopGrade':         nopGrade,
      'answer':           answer,
      //'options':          options,
  };
}

class ExamQuest{

  int id=0;
  int examContentId=0; // id from ExamContent
  String userId='';
  String subject='';
  String question='';
  String type='';  // multiple choice (mc), essay, mc one answer, mc multiple answer
  bool answerBool=false;
  String number="";
  var answer = Rx(false).obs;

  ExamQuest({
    this.id=0,
    this.examContentId=0,
    this.userId='',
    this.subject='',
    this.question='',
    this.type='',
    this.answerBool=false,
    this.number="",
  });

  factory ExamQuest.fromJson(Map<String, dynamic> parsedJson){

    return ExamQuest(
        id:            parsedJson['id'] as int,
        examContentId: parsedJson['examContentId'] as int,
        userId:        parsedJson['userId'] as String,
        subject:       parsedJson['subject'] as String,
        question:      parsedJson['question'] as String,
        type:          parsedJson['type'] as String,
        answerBool:    parsedJson['answerBool'] as bool,
        number:        parsedJson['number'] as String,
    );

  }

  Map<String, dynamic> toJson() =>{

        'id':              id,
        'examContentId':   examContentId,
        'userId':          userId,
        'subject':         subject,
        'question':        question,
        'type':            type,
        'answerBool':      answerBool,
        'number':          number,       
  };
}

class ExamEssay{

      int id=0;
    	int examContentId=0; // id from ExamQuest
    	String userId='';
    	String essay=''; //
      String fileType='';
      String projectFile='';
      String projectLink='';
      late List<ExamScore> examScores;

  ExamEssay({
    this.id=0,
    this.examContentId=0,
    this.userId='',
    this.essay='',
    this.fileType='',
    this.projectFile='',
    this.projectLink='',
    required this.examScores,
  });

  factory ExamEssay.fromJson(Map<String, dynamic> parsedJson){

      var list = parsedJson['examScores'] as List;

      return ExamEssay(
        id: parsedJson['id'] as int,
        examContentId: parsedJson['examContentId'] as int,
        userId: parsedJson['userId'] as String,
        essay: parsedJson['essay'] as String,
        fileType: parsedJson['fileType'] as String,
        projectFile: parsedJson['projectFile'] as String,
        projectLink: parsedJson['projectLink'] as String,
        examScores: list.map((e) => ExamScore.fromJson(e)).toList(),
      );
  }

  Map<String, dynamic> toJson() =>{

    'id': id,
    'examContentId': examContentId,
    'userId': userId,
    'essay': essay,
    'fileType': fileType,
    'projectFile': projectFile,
    'projectLink': projectLink,

  };

}

class ExamScore{

  int id=0;
  int examEssayId=0; // id from ExamQuest
  String userId='';
  String type='';
  String parameter='';
  String description='';
  String evaluation='';
  double maxScore=0.0;
  double score=0.0;
  late List<ExamQuality> examQualities;

  ExamScore({
    this.id=0,
    this.examEssayId=0,
    this.userId='',
    this.type='',
    this.parameter='',
    this.description='',
    this.evaluation='',
    this.maxScore=0,
    this.score=0,
    required this.examQualities,
  });

  factory ExamScore.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['examQualities'] as List;

    return ExamScore(
      id:             parsedJson['id'] as int,
      examEssayId:    parsedJson['examEssayId'] as int,
      userId:         parsedJson['userId'] as String,
      type:           parsedJson['type'] as String,
      parameter:      parsedJson['parameter'] as String,
      description:    parsedJson['description'] as String,
      evaluation:     parsedJson['evaluation'] as String,
      maxScore:       parsedJson['maxScore'] as double,
      score:          parsedJson['score'] as double,
      examQualities: list.map((e) => ExamQuality.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() =>{
      'id':           id,
      'examEssayId':  examEssayId,
      'userId':       userId,
      'type':         type,
      'parameter':    parameter,
      'description':  description,
      'evaluation':   evaluation,
      'maxScore':     maxScore,
      'score':        score,
  };


}

class ExamQuality{

  int id=0;
  int examScoreId=0; // id from ExamScore
  String userId='';
  int number = 0;
  String quality='';
  String description='';
  String evaluation='';
  double maxScore=0;
  double score=0;

  ExamQuality({
    this.id=0,
    this.examScoreId=0,
    this.userId='',
    this.number=0,
    this.quality='',
    this.description='',
    this.evaluation='',
    this.maxScore=0,
    this.score=0,
  });

  factory ExamQuality.fromJson(Map<String, dynamic> parsedJson){

    return ExamQuality(

        id: parsedJson['id'] as int,
        examScoreId: parsedJson['examScoreId'] as int, // id from ExamScore
        userId: parsedJson['userId'] as String,
        number: parsedJson['number'] as int,
        quality: parsedJson['quality'] as String,
        description: parsedJson['description'] as String,
        evaluation: parsedJson['evaluation'] as String,
        maxScore: parsedJson['maxScore'] as double,
        score: parsedJson['score'] as double,
    );
  }

  Map<String, dynamic> toJson() =>{

    'id': id,
    'examScoreId': examScoreId, // id from ExamScore
    'userId': userId,
    'number': number,
    'quality': quality,
    'description': description,
    'evaluation': evaluation,
    'maxScore': maxScore,
    'score': score,

  };



}