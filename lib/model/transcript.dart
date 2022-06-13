import 'credential.dart';

class Transcript {

  int id=0;
  int credentialId=0;
  int curriculumId=0;
  int levelId=0;
  int degreeId=0;
  int classificationId=0;
  int branchId=0;
  int companyId=0;
  String cif="";
  String partnerId="";
  String curriculumName="";
  String level="";
  int date=0;
  int year=0;
  int month=0;
  Credential credential = Credential();

  Transcript({

    this.id=0,
    this.credentialId=0,
    this.curriculumId=0,
    this.levelId=0,
    this.degreeId=0,
    this.classificationId=0,
    this.branchId=0,
    this.companyId=0,
    this.cif='',
    this.partnerId='',
    this.curriculumName='',
    this.level='',
    this.date=0,
    this.year=0,
    this.month=0,
    required this.credential,

  });

  factory Transcript.fromJson(Map<String, dynamic> parsedJson){

    return Transcript(
      id: parsedJson['id'] as int,
      credentialId: parsedJson['credentialId'] as int,
      curriculumId: parsedJson['curriculumId'] as int,
      levelId: parsedJson['levelId'] as int,
      degreeId: parsedJson['degreeId'] as int,
      classificationId: parsedJson['classificationId'] as int,
      branchId: parsedJson['branchId'] as int,
      companyId: parsedJson['companyId'] as int,
      cif: parsedJson['cif'] as String,
      partnerId: parsedJson['partnerId'] as String,
      curriculumName: parsedJson['curriculumName'] as String,
      level: parsedJson['level'] as String,
      date: parsedJson['date'] as int,
      year: parsedJson['year'] as int,
      month: parsedJson['month'] as int,
      credential: Credential.fromJson(parsedJson['credential'])
    );

  }

  Map<String, dynamic> toJson()=> {

      'id': id,
      'credentialId': credentialId,
      'curriculumId': curriculumId,
      'levelId': levelId,
      'degreeId': degreeId,
      'classificationId': classificationId,
      'branchId': branchId,
      'companyId': companyId,
      'cif': cif,
      'partnerId': partnerId,
      'curriculumName': curriculumName,
      'level': level,
      'date': date,
      'year': year,
      'month': month,
      'credential': credential,

  };
  
}